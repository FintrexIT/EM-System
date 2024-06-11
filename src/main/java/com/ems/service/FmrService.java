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
import com.ems.repo.UserRepo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
    private UserRepo repors;
    @Autowired
    private FilePendingRepo fmrrepo;

    public DataTablesResponse<FmrDTO> getFmrs(DataTableRequest param) throws Exception {
        String stage = param.getData();
        String stage1 = param.getData();
        String stage2 = param.getData();
        String stage3 = param.getData();

        String sql = "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE TRUE";
        if (!stage.equals("all")) {
            if (stage.equals("acknowledgment")) {
                sql += " AND `status`='Acknowledgment Pending'";
            } else if (stage.equals("file")) {
                sql += " AND `status`='Exceptions'";
            } else if (stage.equals("acknowledged")) {
                sql += " AND `status`='Acknowledged'";
            } else if (stage.equals("underrec")) {
                sql += " AND `status`='Undertaking Recommendation'";
            } else if (stage.equals("underapp")) {
                sql += " AND `status`='Undertaking Approval Pending'";
            } else if (stage.equals("payment")) {
                sql += " AND `status`='Payment Voucher Hand Over To Finance'";
            } else if (stage.equals("paymentunder")) {
                sql += " AND `status`='Payment Voucher Hand Over To Finance(Undertaking Approval)'";
            } else if (stage.equals("completed")) {
                sql += " AND `status`='Completed'";
            } else if (stage.equals("completedun")) {
                sql += " AND `status`='Completed(Undertaking Approval)'";
            } else if (stage.equals("rejected")) {
                sql += " AND `status`='Rejected'";
            }
        }
        return userDt.getData(FmrDTO.class, param, sql);

    }

    //    branch
    public DataTablesResponse<FmrDTO> getFmrsBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }
//Approver

    public DataTablesResponse<FmrDTO> getFmrApprove(DataTableRequest param, Integer userId) throws Exception {
        String stage = param.getData();
        String sql;

        // Construct SQL query based on the stage
        if (stage.equals("underrec")) {
            sql = "SELECT x.`id`, x.`customer_name`, x.`status`, x.`ref_number`, "
                    + "(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product, "
                    + "(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch, "
                    + "x.`amount`, x.`pendings`, x.`comment`, x.`approver`, x.`facility_status`, "
                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`, "
                    + "x.`ent_on`, "
                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`, "
                    + "x.`mod_on` "
                    + "FROM `fmr` X "
                    + "WHERE x.`status` = 'Undertaking Recommendation'";
        } else {
            sql = "SELECT x.`id`, x.`customer_name`, x.`status`, x.`ref_number`, "
                    + "(SELECT `description` FROM `loan`.`product` WHERE `id` = x.`product`) AS product, "
                    + "(SELECT `name` FROM `loan`.`branch` WHERE `id` = x.`branch`) AS branch, "
                    + "x.`amount`, x.`pendings`, x.`comment`, x.`approver`, x.`facility_status`, "
                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`, "
                    + "x.`ent_on`, "
                    + "(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`, "
                    + "x.`mod_on` "
                    + "FROM `fmr` X "
                    + "WHERE x.`approver` = ? AND x.`status` = 'Undertaking Approval Pending'";
        }

        // Execute the query with the userId parameter if the stage is not underrec
        if (!stage.equals("underrec")) {
            return userDt.getData(FmrDTO.class, param, sql, userId);
        } else {
            return userDt.getData(FmrDTO.class, param, sql);
        }
    }

    public DataTablesResponse<FmrDTO> getFmrApprovse(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Acknowledgment Pending' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrfileBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='File Pending Details' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrclearanceBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='File Pending Clearance' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrapprovalBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,(SELECT `name` FROM `users` WHERE `id` = x.`approver`)AS approver,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Undertaking Approval Pending' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrpaymentBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Payment Voucher Hand Over To Finance' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrpaymentUABranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Payment Voucher Hand Over To Finance(Undertaking Approval)' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrCompletedBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Completed' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public DataTablesResponse<FmrDTO> getFmrRejectBranch(DataTableRequest param, Integer userId) throws Exception {
        return userDt.getData(FmrDTO.class, param, "SELECT x.`id`,x.`customer_name`,x.`status`,x.`ref_number`,(SELECT `description` FROM `loan`.`product`  WHERE `id` = x.`product`) AS product,(SELECT `name` FROM `loan`.`branch`  WHERE `id` = x.`branch`) AS branch ,x.`amount`,x.`pendings`,x.`comment`,x.`approver`,x.`facility_status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `fmr` X WHERE `status`='Rejected' AND x.branch = (SELECT `branch` FROM `users` WHERE `id` = ?)", userId);

    }

    public Iterable<SlimSelectDTO> getStatus(String search) {
        return repor.getStatus("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getBranches(String search) {
        return repor.getBranches("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getProduct(String search) {
        return repor.getProduct("%" + search.trim() + "%");
    }

    public Fmr saveFmr(String ref_number, String customer_name, String product, String amount, String facility_status, HttpSession session) {
        Fmr savefmr = new Fmr();
        savefmr.setRef_number(ref_number);
        savefmr.setCustomer_name(customer_name);
        savefmr.setProduct(product);
        savefmr.setAmount(amount);
        savefmr.setFacility_status(facility_status);
        String branchFromSession = (String) session.getAttribute("branch");
        savefmr.setBranch(branchFromSession);
        savefmr.setStatus("Acknowledgment Pending");
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

            case "acknowledged":
                updatefmr.setStatus("Acknowledged");
                break;

            default:
                // Handle default case if necessary
                break;
        }

        updatefmr = repo.save(updatefmr);
        return updatefmr;
    }

    public Map<String, Object> getFmrses(Integer id) throws Exception {
        Fmr sys = repo.findById(id).get();

        Map<String, Object> product = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product`  WHERE `id` = ?", sys.getProduct());
        sys.setProductTxt((String) product.get("product_txt"));
        System.out.println(product);

        Map<String, Object> name = jdbc.queryForMap("SELECT `name` as entered FROM `users` WHERE `id` = ?", sys.getEnt_by());
        sys.setEntUser((String) name.get("entered"));
        System.out.println(name);

        Map<String, Object> combinedData = new HashMap<>();
        combinedData.put("d1", product);
        combinedData.put("d2", name);
        combinedData.put("obj", sys);

        return combinedData;
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

    public Fmr uploadFiles(Integer id, String desclist, String statusack) throws Exception {
        Fmr system = repo.findById(id).orElseThrow(() -> new Exception("Record not found with id: " + id));
        system.setPendings(system.getId());

        system = repo.save(system);

        switch (statusack) {
            case "payProcess":
                system.setStatus("Payment Voucher Hand Over To Finance");
                break;

            case "fileped":
                system.setStatus("Exceptions");
                JsonNode fileList = mapper.readTree(desclist);
                for (JsonNode fileItem : fileList) {
                    FilePendings attachment = new FilePendings();
                    attachment.setPendings(system.getId());
                    attachment.setName(fileItem.get("name").asText());
                    attachment.setJustification(fileItem.get("justification").asText());
                    attachment.setDate(LocalDate.parse(fileItem.get("completionDate").asText()));
                    attachment.setStatus("active");
                    fmrrepo.save(attachment);
                }
                break;

            default:
                // Handle default case if necessary
                break;
        }

        return repo.save(system);
    }

    public Object getClearance(Integer id) throws Exception {
        Fmr sys = repo.findById(id).orElseThrow(() -> new Exception("Fmr not found for id: " + id));

        Map<String, Object> data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product` WHERE `id` = ?", sys.getProduct());
        System.out.println(data);
        sys.setProductTxt((String) data.get("product_txt"));

        Map<String, Object> datas = jdbc.queryForMap("SELECT `name` as approvername FROM `users` WHERE `id` = ?", sys.getApprover());
        System.out.println(datas);
        sys.setApproverName((String) datas.get("approvername"));

        Fmr content = repo.findById(id).orElseThrow(() -> new Exception("Fmr not found for id: " + id));
        List<FilePendings> videos = fmrrepo.findByPendingsAndStatus(id, "active");

        for (FilePendings video : videos) {
            Map<String, Object> name = jdbc.queryForMap("SELECT `name` as entered FROM `users` WHERE `id` = ?", video.getMod_by());
            String enteredName = (String) name.get("entered");
            System.out.println(name);
            video.setModby(enteredName);
        }

        // Adding all the data to the return map
        Map<String, Object> result = new HashMap<>();
        result.put("productData", data);
        result.put("approverData", datas);
        result.put("content", content);
        result.put("videos", videos);

        return result;
    }

    public Fmr updateClearance(Integer id, String desclist, String deleteIds, String statusclr) {
        try {
            Fmr system = repo.findById(id).orElseThrow(() -> new Exception("FMR not found"));

            // Handle deleteIds
            if (deleteIds != null) {
                JsonNode toBeDeleted = mapper.readTree(deleteIds);
                for (JsonNode jsonNode : toBeDeleted) {
                    Optional<FilePendings> optionalMembers = fmrrepo.findById(Integer.parseInt(jsonNode.asText()));
                    if (optionalMembers.isPresent()) {
                        FilePendings attachmentToDelete = optionalMembers.get();
                        attachmentToDelete.setStatus("deactivate");
                        fmrrepo.save(attachmentToDelete);
                    } else {
                        throw new Exception("FMR with ID " + jsonNode.asText() + " not found");
                    }
                }
            }

            // Handle desclist
            if (desclist != null && !desclist.isEmpty()) {
                JsonNode fileList = mapper.readTree(desclist);
                for (int i = 0; i < fileList.size(); i++) {
                    JsonNode fileItem = fileList.get(i);
                    String fileName = fileItem.get("name").asText();

                    FilePendings attachment = new FilePendings();
                    attachment.setPendings(system.getId());
                    attachment.setName(fileName);
                    attachment.setStatus("active");
                    fmrrepo.save(attachment);
                }
            }

            // Handle statusclr
            if ("approve".equals(statusclr)) {
//                system.setApprover(approver);
                system.setStatus("Undertaking Recommendation");
            } else if ("cleared".equals(statusclr)) {
                system.setStatus("Payment Voucher Hand Over To Finance");
            }

            return repo.save(system);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update FMR with File Pendings", e);
        }
    }

    private boolean containsMembersId(String desclist, Integer attachmentId) throws JsonProcessingException {
        JsonNode fileList = mapper.readTree(desclist);
        for (int i = 0; i < fileList.size(); i++) {
            JsonNode fileItem = fileList.get(i);
            Integer fileId = fileItem.get("fileId").asInt();
            if (fileId.equals(attachmentId)) {
                return true;
            }
        }
        return false;
    }

    public Iterable<SlimSelectDTO> getApprover(String search) {
        return repors.getApprover("%" + search.trim() + "%");
    }

    public Fmr updateRecommendation(Integer id, String approver) throws Exception {
        Fmr rec = repo.findById(id).get();

        rec.setApprover(approver);
        rec.setStatus("Undertaking Approval Pending");

        rec = repo.save(rec);
        return rec;
    }

    public Fmr updateUndertaking(Integer id, String statusund) throws Exception {
        Fmr updatefmr = repo.findById(id).get();

        switch (statusund) {
            case "returned":
                updatefmr.setStatus("Exceptions");

                break;
            case "approved":
                updatefmr.setStatus("Payment Voucher Hand Over To Finance(Undertaking Approval)");
                break;

            default:
                // Handle default case if necessary
                break;
        }

        updatefmr = repo.save(updatefmr);
        return updatefmr;
    }

    public Fmr updatePaymentUP(Integer id, String desclist, String deleteIds, String statusvoucherun) {
        try {
            Fmr system = repo.findById(id).orElseThrow(() -> new Exception("FMR not found"));

            // Handle deleteIds
            if (deleteIds != null) {
                JsonNode toBeDeleted = mapper.readTree(deleteIds);
                for (JsonNode jsonNode : toBeDeleted) {
                    Optional<FilePendings> optionalMembers = fmrrepo.findById(Integer.parseInt(jsonNode.asText()));
                    if (optionalMembers.isPresent()) {
                        FilePendings attachmentToDelete = optionalMembers.get();
                        attachmentToDelete.setStatus("deactivate");
                        fmrrepo.save(attachmentToDelete);
                    } else {
                        throw new Exception("FMR with ID " + jsonNode.asText() + " not found");
                    }
                }
            }

            // Handle desclist
            if (desclist != null && !desclist.isEmpty()) {
                JsonNode fileList = mapper.readTree(desclist);
                for (int i = 0; i < fileList.size(); i++) {
                    JsonNode fileItem = fileList.get(i);
                    String fileName = fileItem.get("name").asText();

                    FilePendings attachment = new FilePendings();
                    attachment.setPendings(system.getId());
                    attachment.setName(fileName);
                    attachment.setStatus("active");
                    fmrrepo.save(attachment);
                }
            }
            switch (statusvoucherun) {
                case "completedun":
                    system.setStatus("Completed(Undertaking Approval)");
                    break;

                default:
                    // Handle default case if necessary
                    break;
            }
            return repo.save(system);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update FMR with File Pendings", e);
        }
    }

    public Map<String, Object> getPayment(Integer id) throws Exception {
        Fmr sys = repo.findById(id).get();

        Map<String, Object> data = jdbc.queryForMap("SELECT `description` as product_txt FROM `loan`.`product`  WHERE `id` = ?", sys.getProduct());
        sys.setProductTxt((String) data.get("product_txt"));
        System.out.println(data);

        Map<String, Object> datas = jdbc.queryForMap("SELECT `name` as approvername FROM `users` WHERE `id` = ?", sys.getApprover());
        sys.setApproverName((String) datas.get("approvername"));
        System.out.println(datas);

        Map<String, Object> combinedData = new HashMap<>();
        combinedData.put("d1", data);
        combinedData.put("d2", datas);
        combinedData.put("obj", sys);

        return combinedData;
    }

    public Fmr updateVoucher(Integer id, String statusvoucher) throws Exception {
        Fmr updatefmr = repo.findById(id).get();

        switch (statusvoucher) {
            case "completed":
                updatefmr.setStatus("Completed");
                break;

            default:
                // Handle default case if necessary
                break;
        }

        updatefmr = repo.save(updatefmr);
        return updatefmr;
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
