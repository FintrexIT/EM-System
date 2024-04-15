<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fintrex - FMR</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <%@include file="jspf/header.jspf" %>
        <style>

            hr {
                height: 2px; /* Set the height of the hr to 2 pixels */
                border: none; /* Remove the default border */
                background-color: black; /* Optional: Set the background color of the hr */
            }

            h6{
                margin-bottom: .5rem;
                font-family: inherit;
                font-weight: 500;
                line-height: 1.1;
                color: white;
                font-weight: 400;
                font-size: 1.2rem;
            }
            .cards .card-block-small {
                padding: 15px 20px;
            }
            .cards {
                position: relative;
                overflow: hidden;
                cursor: pointer;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
                transition: transform 0.3s ease; /* Add a transition for the transform property */
                margin-left: 30px;

            }

            .cards:hover {
                transform: translateY(-5px); /* Move the card up slightly on hover */
            }

            .cards::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                transition: all 0.3s ease;
                opacity: 0;
                transform: translateY(100%);
                overflow: hidden;
                padding: 10px 0;
                background-color: rgba(255, 255, 255, 0.9); /* Add a background color for the "like" popup */
                border-radius: 10px; /* Match the border-radius of the card */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5); /* Match the box-shadow of the card */
            }

            .cards:hover::before {
                opacity: 1;
                transform: translateY(-100%); /* Move the "like" popup up */
            }


            .cards i {
                position: absolute;
                bottom: 10px;
                left: -20px;
                transition: all 0.3s ease;
                transform-origin: bottom left;
                transform: scale(3.5) ;
                opacity: 0.5; /* Set the opacity to 50% */
            }

            .cards:hover i {
                transform: rotate(15deg) scale(5);
                opacity: 0.5; /* Set the opacity to 100% on hover */
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }
            .card-registration .select-arrow {
                top: 13px;
            }
            .card{
                width: 90em;
                justify-content: center;
                margin: auto;

            }
            .pagetitle h3 {
                font-size: 28px;
                margin-bottom: 0;
                font-weight: 600;
                color: #31d422;
            }
        </style>
    </head>
    <body>
        <%@include file="jspf/navbar.jspf" %>

        <div class="main" id="tableSection">

            <section class="navi-card" style="padding: 0rem 2rem;">
                <div class="row " style="margin-bottom: 1px;margin-top: 10px;">  
                    <div class="col-12 card" style="padding-top: 2px" >
                        <h4>File Movement Register</h4>
                    </div>
                </div>
                <div class="row" style="padding: 0rem 4rem;margin-top: 1rem;">  
                    <div class="col">
                        <div class="cards bg-c-info  text-white widget-visitor-card cardActive" id="allcrd" style="height: 100px;background: linear-gradient(to right, #007bff, #5ba9fd);">
                            <div class="card-block-small text-center">
                                <h4 id="coldd">0</h4>
                                <h6>All</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-align-center"><line x1="18" y1="10" x2="6" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="18" y1="18" x2="6" y2="18"></line></svg>
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col" > 
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="ackncrd" style="height: 100px; background: linear-gradient(to right,#f2c71b, #f5d862);">
                            <div class="card-block-small text-center" >
                                <h4 id="warmm">0</h4>
                                <h6>Acknowledgment Pending</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col" >
                        <div class="cards bg-c-pink  text-white widget-visitor-card" id="pendcrd" style="height: 100px;background: linear-gradient(to right, #4eb9ed, #a7d8f0);">
                            <div class="card-block-small text-center">
                                <h4 id="hott">0</h4>
                                <h6>File Pending Details</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col" > 
                        <div class="cards  bg-c-green text-white widget-visitor-card" id="apprvcrd" style="height: 100px;    background: linear-gradient(to right, #f1948a, #f5b7b1);">
                            <div class="card-block-small text-center">
                                <h4 id="pprospetingl">0</h4>
                                <h6>File Pending Clearance</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>    
                                </i>
                            </div>
                        </div>
                    </div>


                </div>


                <div class="row" style="padding: 1rem 4rem;">  
                    <div class="col" > 
                        <div class="cards  bg-c-green text-white widget-visitor-card" id="apprvcrd" style="height: 100px;    background: linear-gradient(to right, #fe9365, #feb798);">
                            <div class="card-block-small text-center">
                                <h4 id="pprospetingl">0</h4>
                                <h6>Undertaking Approval Pending</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col" > 
                        <div class="cards   bg-c-lite-green text-white widget-visitor-card" id="paycrd" style="height: 100px;background: linear-gradient(to right, #01a9ac, #01dbdf);">
                            <div class="cards-block-small text-center">
                                <h4 id="conv_count">0</h4>
                                <h6>Payment Voucher Hand Over To Finance</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-dollar-sign"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col"> 
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="ackncrd" style="height: 100px; background: linear-gradient(to right, #0ac282, #0df3a3);">
                            <div class="card-block-small text-center" >
                                <h4 id="warmm">0</h4>
                                <h6>Completed</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>    
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="cards bg-c-pink  text-white widget-visitor-card" id="pendcrd" style="height: 100px;background: linear-gradient(to right, #fe5d70, #fe909d);">
                            <div class="card-block-small text-center">
                                <h4 id="hott">0</h4>
                                <h6>Rejected</h6>
                                <i class="feather ">

                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>    
                                </i>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="text-right" style="margin-top: 1rem;">
                        <button id="addFmrBtn" class="btn btn-sm waves-effect waves-light btn-danger" style="width: 10rem;">
                            <div class="row" style="margin-top: 2px;">
                                <div class="col-3">
                                    <i class="icon feather icon-plus" style="font-size: 1.5rem;"></i>
                                </div> 
                                <div class="col-9">
                                    <h5>Add FMR</h5>  
                                </div>   
                            </div>

                        </button>
                    </div>


                </div>
                <hr>

            </section>
            <section class="tab-details"style="padding: 1rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - All</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="all_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th style="display: none">ID</th>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th>Branch</th>
                                                <th>ENT Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - Acknowledgment Pending</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="ackn_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th style="display: none">ID</th>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>                                               
                                                <th>Branch</th>
                                                <th>ENT Date</th>                                            
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - File Pending Details</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - File Pending Clearance</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - Undertaking Approval Pending</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - Payment Voucher Hand Over To Finance(Undertaking Approval)</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - Completed</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register - Rejected</h5>
                                <hr>
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="main_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th>Reference Number</th>
                                                <th>Customer Name</th>
                                                <th>Product</th>
                                                <th>Finance Amount</th>
                                                <th style="display: none">ID</th>
                                                <th>Branch</th>
                                                <th>ENT User</th>
                                                <th>ENT Date</th>
                                                <th>MOD User</th>
                                                <th>MOD Date</th>

                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </div>
        <div class="" id="formSection" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0" >

                    <div class="form-group">
                        <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                        <input id="ref_number" type="text" name="ref_number" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="name">Customer's Name<span class="text-danger">*</span></label>
                        <input id="customer_name" type="text" name="ref_number" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Product Type</label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="product">  </select>                                      
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Amount<span class="text-danger">*</span></label>
                        <input id="amount" type="number" name="amount" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Facility Type</label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="facility_status">  </select>                                      
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtn" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtn" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!--formSection-inprogress-->
        <div class="" id="formSectionInprogress" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="form-group">
                        <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                        <input id="ref_numbers" type="text" name="ref_number" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                        <input id="customer_names" type="text" name="customer_name" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="product" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Product Type</label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="products"></select>                                      
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount">Amount<span class="text-danger">*</span></label>
                        <input id="amounts" type="number" name="amount" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="facility_status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statustype" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="acknowledgment_pending">Acknowledged </option>
                                <option value="filepending">File Pending</option>
                                <option value="reject">Reject</option>
                            </select>                                      
                        </div>
                    </div>
                    <div class="form-group" id="reason_section" style="display: none;">
                        <label for="reason">Comment<span class="text-danger">*</span></label>
                        <textarea id="reason_textarea" name="reason" class="form-control" required></textarea>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnin" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnin" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="files/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="files/js/dataTables.searchHighlight.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Get all the tab-details sections
                const tabDetails = document.querySelectorAll('.tab-details');

                // Hide all tab-details sections except for the first one (corresponding to the "All" card)
                tabDetails.forEach(function (section, index) {
                    if (index !== 0) {
                        section.style.display = 'none';
                    }
                });

                // Get all the card elements
                const cards = document.querySelectorAll('.cards');

                // Add click event listener to each card
                cards.forEach(function (card, index) {
                    card.addEventListener('click', function () {
                        // Hide all tab-details sections
                        tabDetails.forEach(function (section) {
                            section.style.display = 'none';
                        });

                        // Show the corresponding tab-details section based on the index
                        tabDetails[index].style.display = 'block';
                    });
                });
            });
            document.addEventListener("DOMContentLoaded", function () {
                var facilityStatusSelect = document.getElementById("statustype");
                var commentSection = document.getElementById("reason_section");

                // Add event listener to the select element
                facilityStatusSelect.addEventListener("change", function () {

                    // Check if the selected value is "reject"
                    if (this.value === "reject") {
                        // Show the comment section
                        commentSection.style.display = "block";
                    } else {
                        // Hide the comment section
                        commentSection.style.display = "none";
                    }
                });
            });




            const formSection = document.getElementById('formSection');
            const tableSection = document.getElementById('tableSection');
            const closeBtn = document.getElementById('closeBtn');
            const closeBtnin = document.getElementById('closeBtnin');

            closeBtn.addEventListener('click', function () {
                formSection.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnin.addEventListener('click', function () {
                formSectionInprogress.style.display = 'none';
                tableSection.style.display = 'block';
            });

            var facility_status = new SlimSelect(
                    {select: '#facility_status',
                        placeholder: "Facility Type",
                        ajax: function (search, callback) {
                            fetch('fmr/facility-status', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });
            var product = new SlimSelect(
                    {select: '#product',
                        placeholder: "Facility Type",
                        ajax: function (search, callback) {
                            fetch('fmr/product', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });
            var products = new SlimSelect(
                    {select: '#products',
                        placeholder: "Facility Type",
                        ajax: function (search, callback) {
                            fetch('fmr/product', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });



            $('#addFmrBtn').click(function () {
                $('#saveBtn').data('mode', 'save');
                $('#saveBtn').html('<i class="icon feather icon-save"></i>Save');
                clearForm();
                $('#tableSection').hide();
                $('#formSection').fadeIn();
            });
            $('.cls-card').click(function () {
                $('#formSection').hide();
                $('#tableSection').fadeIn();
            });
            function clearForm() {
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('select').each(function () {
                    if ($(this).data('select')) {
                        if ($(this).data('select').ajax) {
                            $(this).data('select').data.data = [];
                        }
                        $(this).data('select').set('');
                    }
                });
            }
            $('#saveBtn').click(function () {

                return fetch((($('#saveBtn').data('mode') === 'save') ? 'fmr/save' : 'fmr/update'), {
                    method: 'POST',
                    body: new URLSearchParams({
                        id: $('#saveBtn').data('id'),
                        ref_number: document.getElementById('ref_number').value,
                        customer_name: document.getElementById('customer_name').value,
                        product: document.getElementById('product').value,
                        amount: document.getElementById('amount').value,
                        facility_status: document.getElementById('facility_status').value,
                    })
                }).then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    } else {
                        Swal.fire('Successfull!', 'FMR has been successfully saved');
                        clearForm();
                        $('#formSection').hide();
                        $('#tableSection').fadeIn();
                        dtable.ajax.reload();
                    }
                    return response.json();
                });
            });



            $('#saveBtnin').click(function () {
                // Get the value of the facility status select element
                var statustype = document.getElementById('statustype').value;

                // Initialize request body
                var requestBody = {
                    id: $('#saveBtnin').data('id'),
                    ref_number: document.getElementById('ref_numbers').value,
                    customer_name: document.getElementById('customer_names').value,
                    product: document.getElementById('products').value,
                    amount: document.getElementById('amounts').value,
                    statustype: statustype,
                };

                // Check if the facility status is "reject"
                if (statustype === "reject") {
                    // Include comment in the request body
                    requestBody.reason = document.getElementById('reason_textarea').value;
                }

                // Send the request
                return fetch((($('#saveBtnin').data('mode') === 'save') ? 'fmr/save' : 'fmr/update-ack'), {
                    method: 'POST',
                    body: new URLSearchParams(requestBody)
                }).then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    } else {
                        Swal.fire('Successfull!', 'FMR has been successfully saved');
                        clearForm();
                        $('#formSectionInprogress').hide();
                        $('#tableSection').fadeIn();
                        dtable.ajax.reload();
                    }
                    return response.json();
                });
            });




            $.fn.dataTable.ext.errMode = 'none';
            var dtable = $('#all_table').DataTable({
                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                "pageLength": 5,
                "ordering": true,
                "autoWidth": false,
                "processing": true,
                "serverSide": true,
                "order": [[0, "desc"]],
                "searchHighlight": true,
                "searchDelay": 350,
                "ajax": {
                    "url": "fmr/fmrtable-all",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        return JSON.stringify(d);
                    },
                    error: function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "id", className: "text-right", "visible": false},
                    {"data": "ref_number"},
                    {"data": "customer_name"},
                    {"data": "product"},
                    {"data": "amount"},
                    {"data": "branch"},
                    {"data": "ent_on"},

                    {"data": "status"}
                ], "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                },
                "createdRow": function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');

                    $(action_td).append('<a href="javascript:void(0)" id="update" class="editrec"><i class="icon feather icon-edit f-w-600 f-16 m-r-10 text-c-green"></i></a>');

                    $(row).append(action_td);
                    $(row).data('id', data['id']);
                }

            });


            $(document).on('click', '.editrec', function () {

                loadDiv($('#tableSection'));
                let id = $(this).parents('tr').data('id');
                fetch('fmr/details-all/' + id)
                        .then(resp => resp.json())
                        .then((resp) => {
                            let data = resp.data;
                            $('#ref_numbers').val(data.ref_number);
                            $('#customer_names').val(data.customer_name);
                            $('#amounts').val(data.amount);
                            $('#saveBtnin').data('mode', 'update-inprogress');
                            $('#saveBtnin').data('id', id);
                            $('#saveBtnin').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                            $('#formSectionInprogress').fadeIn();
                            $('#tableSection').hide();
                            finishLoadDiv($('#tableSection'));
                        });
            });





            // In Progress

            $.fn.dataTable.ext.errMode = 'none';
            var dtable = $('#ackn_table').DataTable({
                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                "pageLength": 5,
                "ordering": true,
                "autoWidth": false,
                "processing": true,
                "serverSide": true,
                "order": [[0, "desc"]],
                "searchHighlight": true,
                "searchDelay": 350,
                "ajax": {
                    "url": "fmr/fmrtable-pending",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        return JSON.stringify(d);
                    },
                    error: function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "id", className: "text-right", "visible": false},
                    {"data": "ref_number"},
                    {"data": "customer_name"},
                    {"data": "product"},
                    {"data": "amount"},
                    {"data": "branch"},
                    {"data": "ent_on"},

                    {"data": "status"}
                ], "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                },
                "createdRow": function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');

                    $(action_td).append('<a href="javascript:void(0)" id="update-inprogress" class="editrec"><i class="icon feather icon-edit f-w-600 f-16 m-r-10 text-c-green"></i></a>');

                    $(row).append(action_td);
                    $(row).data('id', data['id']);
                }

            });
        </script>
    </body>
</html>
