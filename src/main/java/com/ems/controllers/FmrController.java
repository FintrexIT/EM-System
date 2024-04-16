/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ems.controllers;

import com.ems.datatable.DataTableRequest;
import com.ems.datatable.DataTablesResponse;
import com.ems.dto.SlimSelectDTO;
import com.ems.dto.FmrDTO;
import com.ems.model.Fmr;
import com.ems.service.FmrService;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/fmr")
public class FmrController {

    @Autowired
    FmrService service;

    @PostMapping("/fmrtable-all")
    public DataTablesResponse<FmrDTO> getFmrs(@RequestBody DataTableRequest param) throws Exception {
        return service.getFmrs(param);
    }

    @PostMapping("/fmrtable-pending")
    public DataTablesResponse<FmrDTO> getFmrPending(@RequestBody DataTableRequest param) throws Exception {
        return service.getFmrPending(param);
    }

    @PostMapping("/fmrtable-file")
    public DataTablesResponse<FmrDTO> getFmrfile(@RequestBody DataTableRequest param) throws Exception {
        return service.getFmrfile(param);
    }

    @PostMapping("/fmrtable-clearance")
    public DataTablesResponse<FmrDTO> getFmrclearance(@RequestBody DataTableRequest param) throws Exception {
        return service.getFmrclearance(param);
    }

    @PostMapping("/fmrtable-payment")
    public DataTablesResponse<FmrDTO> getFmrpayment(@RequestBody DataTableRequest param) throws Exception {
        return service.getFmrpayment(param);
    }

    @PostMapping("/facility-status")
    public Iterable<SlimSelectDTO> getStatus(@RequestParam String search) throws Exception {
        return service.getStatus(search);
    }

    @PostMapping("/product")
    public Iterable<SlimSelectDTO> getProduct(@RequestParam String search) throws Exception {
        return service.getProduct(search);
    }

    @PostMapping("/save")
    public ResponseEntity<CommonResponse> saveFmr(@RequestParam String ref_number, @RequestParam String customer_name, @RequestParam String product, @RequestParam String amount, @RequestParam String facility_status) throws Exception {
        service.saveFmr(ref_number, customer_name, product, amount, facility_status);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/update-ack")
    public ResponseEntity<CommonResponse> updateFmr(@RequestParam Integer id, @RequestParam String ref_number, @RequestParam String customer_name, @RequestParam String product, @RequestParam String amount, @RequestParam String statustype, @RequestParam(required = false) String reason) throws Exception {
        service.updateFmr(id, ref_number, customer_name, product, amount, statustype, reason);
        CommonResponse response = new CommonResponse("Success!", 200);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/details-all/{id}")
    public ResponseEntity<CommonResponse> details(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getFmrses(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/details-file/{id}")
    public ResponseEntity<CommonResponse> detailsFile(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getFmrFile(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save-filePendings")
    @ResponseBody
    public Fmr uploadFiles(@RequestParam Integer id, @RequestParam("desclist") String desclist) throws Exception {
        return service.uploadFiles(id, desclist);
    }

    @GetMapping("/clearance-details/{id}")
    public ResponseEntity<CommonResponse> getClearance(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getClearance(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/update-fileclearance")
    @ResponseBody
    public Fmr updateClearance(String id, String desclist, @RequestParam(value = "deleteIds", required = false) String deleteIds, @RequestParam String statusclr, @RequestParam(required = false) String approver) throws Exception {
        Integer idd = Integer.parseInt(id);
        // Pass deleteIds to the service method
        System.out.println(deleteIds);
        return service.updateClearance(idd, desclist, deleteIds, statusclr, approver);

    }

    @PostMapping("/approver")
    public Iterable<SlimSelectDTO> getApprover(@RequestParam String search) throws Exception {
        return service.getApprover(search);
    }
//
//    @GetMapping("/content")
//    public Iterable<Fmr> getAllActiveImages() {
//        return service.findAllActiveImages();
//    }
//

//
//    @PostMapping("/deactivate-fmr")
//    public ResponseEntity<CommonResponse> deactivateFmrs(@RequestParam Integer id) throws Exception {
//        service.deactivateFmrs(id);
//        CommonResponse response = new CommonResponse("Success!", 200);
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }
//
//    @PostMapping("/reactivate-fmr")
//    public ResponseEntity<CommonResponse> reactivateFmrs(@RequestParam Integer id) throws Exception {
//        service.reactivateFmrs(id);
//        CommonResponse response = new CommonResponse("Success!", 200);
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }
}
