/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ems.service;

import com.ems.datatable.DataTableRepo;
import com.ems.datatable.DataTableRequest;
import com.ems.datatable.DataTablesResponse;
import com.ems.dto.SlimSelectDTO;
import com.ems.dto.FmrDTO;
import com.ems.model.FilePendings;
import com.ems.model.Fmr;
import com.ems.repo.FacilityTypeRepo;
import com.ems.repo.FilePendingRepo;
import com.ems.repo.FmrRepo;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.nio.file.Path;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author L580
 */
@Service
public class FmrService {

    @Autowired
    private DataTableRepo<FmrDTO> userDt;
    @Autowired
    private FmrRepo repo;
    @Autowired
    private FacilityTypeRepo repor;
    @Autowired
    private FilePendingRepo fmrrepo;

    public DataTablesResponse<FmrDTO> getFmrs(DataTableRequest param) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approved_by`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE TRUE");

    }

    public DataTablesResponse<FmrDTO> getFmrPending(DataTableRequest param) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approved_by`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Acknowledgment Pending'");

    }

    public DataTablesResponse<FmrDTO> getFmrfile(DataTableRequest param) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approved_by`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='File Pending Details'");

    }

    public Iterable<SlimSelectDTO> getStatus(String search) {
        return repor.getStatus("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getProduct(String search) {
        return repor.getProduct("%" + search.trim() + "%");
    }

    public Fmr saveFmr(String ref_number, String customer_name, String product, String amount, String facility_status) {
        Fmr savefmr = new Fmr();
        savefmr.setRef_number(ref_number);
        savefmr.setCustomer_name(customer_name);
        savefmr.setProduct(product);
        savefmr.setAmount(amount);
        savefmr.setFacility_status(facility_status);
        savefmr.setStatus("In Progress");
        savefmr = repo.save(savefmr);

        return savefmr;
    }

    public Fmr updateFmr(Integer id, String ref_number, String customer_name, String product, String amount, String statustype, String reason) throws Exception {
        Fmr updatefmr = repo.findById(id).get();

        updatefmr.setRef_number(ref_number);
        updatefmr.setCustomer_name(customer_name);
        updatefmr.setProduct(product);
        updatefmr.setAmount(amount);

        switch (statustype) {
            case "reject":
                updatefmr.setStatus("Rejected");
                updatefmr.setReason(reason);
                break;
            case "filepending":
                updatefmr.setStatus("File Pending Details");
                break;
            case "acknowledgment_pending":
                updatefmr.setStatus("Payment Voucher Hand Over To Finance");
                break;
            // Add more cases if needed for other facility statuses
            default:
                // Handle default case if necessary
                break;
        }

        updatefmr = repo.save(updatefmr);
        return updatefmr;
    }

    public Fmr getFmrses(Integer id) throws Exception {
        Fmr sys = repo.findById(id).get();
        return sys;
    }

    @Autowired
    private JdbcTemplate jdbc;

    public Fmr getFmrFile(Integer id) throws Exception {
        Fmr sys = repo.findById(id).get();

        Map<String, Object> data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product`  WHERE `id` = ?", sys.getProduct());
        System.out.println(data);
        sys.setProductTxt((String) data.get("product_txt"));

        return sys;
    }

    private final ObjectMapper mapper = new ObjectMapper();

    public Fmr uploadFiles(Integer id, String desclist) throws Exception {
        Fmr system = repo.findById(id).get();
        system.setPendings(system.getId());
        system.setStatus("File Pending Clearance");
        system = repo.save(system);

        JsonNode fileList = mapper.readTree(desclist);
        for (int i = 0; i < fileList.size(); i++) {
            JsonNode fileItem = fileList.get(i);

            FilePendings attachment = new FilePendings();
            attachment.setPendings(system.getId());
            attachment.setName(fileItem.get("name").asText());
            attachment.setStatus("active");
            attachment = fmrrepo.save(attachment);
            fmrrepo.save(attachment);
        }

        return repo.save(system);
    }
//
//    public Fmr deactivateFmrs(Integer id) throws Exception {
//        Fmr syst = repo.findById(id).get();
//        syst.setStatus("deactivate");
//        syst = repo.save(syst);
//        return syst;
//    }
//
//    public Fmr reactivateFmrs(Integer id) throws Exception {
//        Fmr systems = repo.findById(id).get();
//        systems.setStatus("active");
//        systems = repo.save(systems);
//        return systems;
//    }
//

//   
//    public Fmr update(Integer id, String name, String type, MultipartFile file) throws Exception {
//        Fmr system = repo.findById(id).get();
//        system.setName(name);
//        system.setType(type);
//        if (file != null) {
//            String[] split = file.getOriginalFilename().split("\\.");
//            File des = new File("intranet\\Fmrs\\" + id + "." + split[split.length - 1]);
//            file.transferTo(Path.of(des.getAbsolutePath()));
//            system.setPath(des.getName());
//        }
//        return repo.save(system);
//    }
//
//    public Iterable<Fmr> findAllActiveImages() {
//        return repo.findByStatus("active");
//    }
}