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
            .placeholder {
                background-color: white;
                color: black;
            }

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
                <div class="row" style="padding: 0rem 2rem;margin-top: 1rem;">  
                    <div class="col">
                        <div class="cards bg-c-info  text-white widget-visitor-card cardActive" id="allcrd" style="height: 110px;background: linear-gradient(to right, #007bff, #5ba9fd);">
                            <div class="card-block-small text-center">
                                <h4 id="all">0</h4>
                                <h6>All</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-align-center"><line x1="18" y1="10" x2="6" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="18" y1="18" x2="6" y2="18"></line></svg>
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col" > 
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="ackncrd" style="height: 110px; background: linear-gradient(to right,#f2c71b, #f5d862);">
                            <div class="card-block-small text-center" >
                                <h4 id="acknowledgment">0</h4>
                                <h6>Acknowledgment Pending</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col" > 
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="acknoedcrd" style="height: 110px; background: linear-gradient(to right,#f2c71b, #f5d862);">
                            <div class="card-block-small text-center" >
                                <h4 id="acknowledgment">0</h4>
                                <h6>Acknowledged</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col" >
                        <div class="cards bg-c-pink  text-white widget-visitor-card" id="pendcrd" style="height: 110px;background: linear-gradient(to right, #4eb9ed, #a7d8f0);">
                            <div class="card-block-small text-center">
                                <h4 id="filepending">0</h4>
                                <h6>Exceptions</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>



                </div>


                <div class="row" style="padding: 1rem 2rem;">  
                    <div class="col" > 
                        <div class="cards  bg-c-green text-white widget-visitor-card" id="apprvcrd" style="height: 110px;    background: linear-gradient(to right, #fe9365, #feb798);">
                            <div class="card-block-small text-center">
                                <h4 id="undertaking">0</h4>
                                <h6>Undertaking Approval Pending</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>


                    <div class="col" > 
                        <div class="cards   bg-c-lite-green text-white widget-visitor-card" id="paycrd" style="height: 110px;background: linear-gradient(to right, #01a9ac, #01dbdf);">
                            <div class="card-block-small text-center">
                                <h4 id="pay">0</h4>
                                <h6>Payment Processing</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-dollar-sign"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                                </i>
                            </div>
                        </div>

                    </div>

                    <div class="col"> 
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="cmplcrd" style="height: 110px; background: linear-gradient(to right, #0ac282, #0df3a3);">
                            <div class="card-block-small text-center" >
                                <h4 id="complt">0</h4>
                                <h6>Completed</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>    
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="cards bg-c-pink  text-white widget-visitor-card" id="rejcrd" style="height: 110px;background: linear-gradient(to right, #fe5d70, #fe909d);">
                            <div class="card-block-small text-center">
                                <h4 id="reject">0</h4>
                                <h6>Rejected</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>    
                                </i>
                            </div>
                        </div>
                    </div>
                    <br>



                </div>
                <hr>

            </section>

            <section class="tab-details"style="padding: 0rem 1rem;"> 
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">File Movement Register</h5>
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
            <section class="tab-details" style="padding: 0rem 1rem;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard-pay">
                            <div class="card-body">
                                <h5 id="main_name_tag">File Movement Register </h5>
                                <hr>
                                <!-- Buttons -->
                                <div style="padding-bottom: 1rem">
                                    <button class="btn btn-primary" id="tab1-btn" >Payment Processing</button>
                                    <button class="btn btn-primary" id="tab2-btn">Payment Processing - Undertaken Approved</button>
                                </div>
                                <!-- Table -->
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="mergedTable" style="width: 100%; font-size: small">
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

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="tab-details" style="padding: 0rem 1rem;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard-com">
                            <div class="card-body">
                                <h5 id="main_name_tag">File Movement Register </h5>
                                <hr>
                                <!-- Buttons -->
                                <div style="padding-bottom: 1rem">
                                    <button class="btn btn-primary" id="tab3-btn">Completed</button>
                                    <button class="btn btn-primary" id="tab4-btn">Completed - Undertaken Approved</button>
                                </div>
                                <!-- Table -->
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="completedTable" style="width: 100%; font-size: small">
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

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="tab-details" style="padding: 0rem 1rem;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard-under">
                            <div class="card-body">
                                <h5 id="main_name_tag">File Movement Register </h5>
                                <hr>
                                <!-- Buttons -->
                                <div style="padding-bottom: 1rem">
                                    <button class="btn btn-primary" id="tab5-btn" >Undertaking Recommendation</button>
                                    <button class="btn btn-primary" id="tab6-btn">Undertaking Approval Pending</button>
                                </div>
                                <!-- Table -->
                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="underTable" style="width: 100%; font-size: small">
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



        <!--formSection-acknowledgment-pending-->
        <div class="" id="formSectionInprogress" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberack" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_nameack" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="products">Product Type<span class="text-danger">*</span></label>
                                <input id="productack" type="text" name="products" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountack" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Ent By<span class="text-danger">*</span></label>
                                <input id="ent_by" type="text" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                        <input id="ref_numbers" type="text" name="ref_number" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                        <input id="customer_names" type="text" name="customer_name" class="form-control" required autocomplete="off" >
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
                                <option value="acknowledged">Acknowledged </option>
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



        <!--File Pending details-->
        <div class="" id="formSectionFilePending" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberp" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namep" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productp" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountp" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="acknow_status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statusack" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="payProcess">Payment Processing </option>
                                <option value="fileped">File Pending </option>
                            </select>                                      
                        </div>
                    </div>
                    <div class="row" style="display: none" id="filependings">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAtt" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files </th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th style="width:1px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div class="row justify-content-end" style="padding: 2em;">
                            <div class="col-lg-6 col-md-12 text-right"> 
                                <div class="text">
                                    <button id="addBtnFile" class="btn btn-sm waves-effect waves-light btn-danger">
                                        <i class="icon feather icon-plus"></i>Add File
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnfile" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnfile" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--Exceptions-->
        <div class="" id="formSectionFileClearance" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberc" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productc" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountc" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAtts" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                            <th style="width:1px;">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                    <div class="row justify-content-end" style="padding: 2em;display: none;">
                        <div class="col-lg-6 col-md-12">
                            <div class="text">
                                <button id="addBtnClr" class="btn btn-sm waves-effect waves-light btn-danger">
                                    <i class="icon feather icon-plus"></i>Add File
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statusclr" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="approve">Undertaking Recommendation</option>
                                <option value="cleared">Exceptions Cleared</option>
                            </select>
                        </div>
                    </div>
                    <!--                    <div class="form-group" id="approve_section" style="display: none;">
                                            <div class="col-sm-6">
                                                <label for="reason">Approver<span class="text-danger">*</span></label>
                                                <select class="form-control-sm pull-right" id="approver"></select> 
                                            </div>
                                        </div>-->

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnclr" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnclr" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Undertaking Recommendation-->
        <div class="" id="formSectionRecommendation" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberrec" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namerec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productrec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountrec" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttsrec" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>

                    <div class="form-group" id="approve_section" >
                        <div class="col-sm-6">
                            <label for="reason">Approver<span class="text-danger">*</span></label>
                            <select class="form-control-sm pull-right" id="approver"></select> 
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnrec" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnrec" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Undertaking Approval Pending-->
        <div class="" id="formSectionApprovalPending" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberu" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_nameu" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productu" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountu" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttu" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                    <div class="row justify-content-end" style="padding: 2em;display: none;">
                        <div class="col-lg-6 col-md-12">
                            <div class="text">
                                <button id="addBtnund" class="btn btn-sm waves-effect waves-light btn-danger">
                                    <i class="icon feather icon-plus"></i>Add File
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statusund" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="approved">Approve</option>
                                <option value="returned">Return to File Pending Clearance</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="return_section" style="display: none;">
                        <label for="return">Return Comment<span class="text-danger">*</span></label>
                        <textarea id="return_textarea" name="return" class="form-control" required></textarea>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnund" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnund" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--Payment Voucher Hand Over To Finance-->
        <div class="" id="formSectionPaymentVoucher" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberpay" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namepay" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productpay" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountpay" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statusvoucher" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="completed">Completed</option>

                            </select>
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnpay" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnpay" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Payment Voucher Hand Over To Finance(Undertaking Approval)-->
        <div class="" id="formSectionPaymentVoucherUnder" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberppun" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_nameppun" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productppun" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountppun" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row" id="approverRow" >
                        <div class="col">
                            <div class="form-group">
                                <label for="approver">Approved By<span class="text-danger">*</span></label>
                                <input id="approvername" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">

                        </div>
                    </div>
                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttpay" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                            <th style="width:1px;">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Status </label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="statusvoucherun" style="width: 20rem;margin-right: 15rem;">
                                <option value="" disabled selected>Select Status</option>
                                <option value="completedun">Completed</option>

                            </select>
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtnppun" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtnppun" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Completed-->
        <div class="" id="formSectionCompleted" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numbercom" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namecom" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productcom" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountcom" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <!--<button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>-->
                        <button id="closeBtncom" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Completed Undertaking-->
        <div class="" id="formSectionCompletedUndertaking" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numbercomund" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namecomund" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productcomund" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountcomund" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Approved By<span class="text-danger">*</span></label>
                                <input id="approvercomund" type="text" name="approver_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">

                        </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtncomun" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Rejected-->
        <div class="" id="formSectionRejected" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberrej" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namerej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productrej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>  
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountrej" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Rejected Reason<span class="text-danger">*</span></label>
                                <textarea id="resonrej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled=""></textarea>
                            </div>  
                        </div>

                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <!--<button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>-->
                        <button id="closeBtnrej" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
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
            document.addEventListener("DOMContentLoaded", function () {
                // Get all the card elements
                const cards = document.querySelectorAll('.widget-visitor-card');

                // Add click event listener to each card
                cards.forEach(card => {
                    card.addEventListener('click', function () {
                        // Get the text of the h6 element inside the clicked card
                        const h6Text = this.querySelector('h6').textContent;

                        // Update the h5 tag of the table with the clicked card's h6 text
                        document.getElementById('main_name_tag').textContent = `File Movement Register - ${h6Text}`;
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

                var acknowSelect = document.getElementById("statusack");
                var filepenSection = document.getElementById("filependings");

                // Add event listener to the select element
                acknowSelect.addEventListener("change", function () {

                    // Check if the selected value is "reject"
                    if (this.value === "fileped") {
                        // Show the comment section
                        filepenSection.style.display = "block";
                    } else {
                        // Hide the comment section
                        filepenSection.style.display = "none";
                    }
                });
            });




            const formSection = document.getElementById('formSection');
            const tableSection = document.getElementById('tableSection');
            const closeBtn = document.getElementById('closeBtn');
            const closeBtnin = document.getElementById('closeBtnin');
            const closeBtnfile = document.getElementById('closeBtnfile');
            const closeBtnclr = document.getElementById('closeBtnclr');
            const closeBtnund = document.getElementById('closeBtnund');
            const closeBtnpay = document.getElementById('closeBtnpay');
            const closeBtnppun = document.getElementById('closeBtnppun');
            const closeBtncom = document.getElementById('closeBtncom');
            const closeBtncomun = document.getElementById('closeBtncomun');
            const closeBtnrej = document.getElementById('closeBtnrej');
            const closeBtnrec = document.getElementById('closeBtnrec');

            closeBtn.addEventListener('click', function () {
                formSection.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnin.addEventListener('click', function () {
                formSectionInprogress.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnfile.addEventListener('click', function () {
                formSectionFilePending.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnclr.addEventListener('click', function () {
                formSectionFileClearance.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnund.addEventListener('click', function () {
                formSectionApprovalPending.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnpay.addEventListener('click', function () {
                formSectionPaymentVoucher.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnppun.addEventListener('click', function () {
                formSectionPaymentVoucherUnder.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtncom.addEventListener('click', function () {
                formSectionCompleted.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtncomun.addEventListener('click', function () {
                formSectionCompletedUndertaking.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnrej.addEventListener('click', function () {
                formSectionRejected.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnrec.addEventListener('click', function () {
                formSectionRecommendation.style.display = 'none';
                tableSection.style.display = 'block';
            });



            $(document).ready(function () {
                // Show/hide tables based on active tab
                $('#myTab a').on('shown.bs.tab', function (e) {
                    var target = $(e.target).attr("href"); // activated tab
                    if (target === "#first") {
                        $('#table_card_first').show();
                        $('#table_card_second').hide();
                    } else if (target === "#second") {
                        $('#table_card_first').hide();
                        $('#table_card_second').show();
                    }
                });
            });

        </script>


        <script>
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
        </script>


        <script>
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
        </script>





        <script>
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





        </script>

        <!--Table Details-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {

                var tab1Btn = document.getElementById("tab1-btn");
                var tab2Btn = document.getElementById("tab2-btn");


                tab1Btn.addEventListener("click", function () {
                    stage1 = 'payment';
                    dtable2.ajax.reload();
                });

                tab2Btn.addEventListener("click", function () {
                    stage1 = 'paymentunder';
                    dtable2.ajax.reload();
                });

                var tab3Btn = document.getElementById("tab3-btn");
                var tab4Btn = document.getElementById("tab4-btn");


                tab3Btn.addEventListener("click", function () {
                    stage2 = 'completed';
                    dtable3.ajax.reload();
                });

                tab4Btn.addEventListener("click", function () {
                    stage2 = 'completedun';
                    dtable3.ajax.reload();
                });

                var tab5Btn = document.getElementById("tab5-btn");
                var tab6Btn = document.getElementById("tab6-btn");


                tab5Btn.addEventListener("click", function () {
                    stage3 = 'underrec';
                    dtable4.ajax.reload();
                });

                tab6Btn.addEventListener("click", function () {
                    stage3 = 'underapp';
                    dtable4.ajax.reload();
                });



            });

            document.addEventListener('DOMContentLoaded', function () {

                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';

                document.getElementById('paycrd').addEventListener('click', function () {

                    document.getElementById('tableCard').style.display = 'none';
                    document.getElementById('tableCard-com').style.display = 'none';
                    document.getElementById('tableCard-pay').style.display = 'block';
                    document.getElementById('tableCard-under').style.display = 'none';
                });
                document.getElementById('cmplcrd').addEventListener('click', function () {

                    document.getElementById('tableCard').style.display = 'none';
                    document.getElementById('tableCard-pay').style.display = 'none';
                    document.getElementById('tableCard-com').style.display = 'block';
                    document.getElementById('tableCard-under').style.display = 'none';
                });
                document.getElementById('apprvcrd').addEventListener('click', function () {

                    document.getElementById('tableCard').style.display = 'none';
                    document.getElementById('tableCard-pay').style.display = 'none';
                    document.getElementById('tableCard-com').style.display = 'none';
                    document.getElementById('tableCard-under').style.display = 'block';
                });
            });

            $('#allcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';
                stage = 'all';
                dtable.ajax.reload();
            });
            $('#ackncrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';
                stage = 'acknowledgment';
                dtable.ajax.reload();
            });
            $('#acknoedcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';
                stage = 'acknowledged';
                dtable.ajax.reload();
            });
            $('#pendcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';
                stage = 'file';
                dtable.ajax.reload();
            });
            $('#clrcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                document.getElementById('tableCard-under').style.display = 'none';
                stage = 'clearance';
                dtable.ajax.reload();
            });
//            $('#apprvcrd').click(function () {
//                document.getElementById('tableCard').style.display = 'block';
//                document.getElementById('tableCard-pay').style.display = 'none';
//                document.getElementById('tableCard-com').style.display = 'none';
//                stage = 'approve';
//                dtable.ajax.reload();
//            });
            $('#payuncrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                stage = 'paymentunder';
                dtable.ajax.reload();
            });
            $('#rejcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                document.getElementById('tableCard-pay').style.display = 'none';
                document.getElementById('tableCard-com').style.display = 'none';
                stage = 'rejected';
                dtable.ajax.reload();
            });
            $('#tab1-tab').click(function () {
                stage1 = 'payment';
                dtable2.ajax.reload();
            });

            let stage = 'all';
            let stage1 = 'payment';
            let stage2 = 'completed';
            let stage3 = 'underrec';

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
                    "url": "fmr/fmrtable-all",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        d.data = stage;
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
                    $(row).data('status', data['status']);

                }

            });

            var dtable2 = $('#mergedTable').DataTable({
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
                        d.data = stage1;
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
                    $(row).data('status', data['status']);

                }

            });

            var dtable3 = $('#completedTable').DataTable({
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
                        d.data = stage2;
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
                    $(row).data('status', data['status']);

                }

            });

            var dtable4 = $('#underTable').DataTable({
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
                    "url": "fmr/fmrtable-all-approver",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        d.data = stage3;
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
                    $(row).data('status', data['status']);

                }

            });
        </script>


        <!--editrec-->
        <script>
            $(document).on('click', '.editrec', function () {
                let row = $(this).closest('tr');
                let status = row.data('status');
                if (status === 'Acknowledgment Pending') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/details-all/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let d2 = data.d2;
                                let obj = data.obj;

                                $('#ref_numberack').val(obj.ref_number);
                                $('#customer_nameack').val(obj.customer_name);
                                $('#amountack').val(obj.amount);
                                $('#productack').val(d1.product_txt);
                                console.log(d1.product_txt);
                                console.log(d2.entered);
                                $('#ent_by').val(d2.entered);
                                $('#saveBtnin').data('mode', 'update');
                                $('#saveBtnin').data('id', id);
                                $('#saveBtnin').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionInprogress').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Acknowledged') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/details-file/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                $('#ref_numberp').val(data.ref_number);
                                $('#customer_namep').val(data.customer_name);
                                $('#amountp').val(data.amount);
                                $('#productp').val(data.productTxt);
                                $('#saveBtnfile').data('mode', 'update-filepending');
                                $('#saveBtnfile').data('id', id);
                                $('#saveBtnfile').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionFilePending').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Exceptions') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');

                    // Fetch team and attachment details
                    fetch('fmr/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberc').val(content.ref_number);
                                $('#customer_namec').val(content.customer_name);
                                $('#amountc').val(content.amount);
                                $('#productc').val(product.product_txt);
                                console.log(data.product_txt);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAtts tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAtts tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);
                                    var actionCell = newRow.insertCell(6);

                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date; // Assuming modifiedOn is available in attachment object

                                    // Create a delete button in the action cell
                                    var deleteButton = document.createElement('button');
                                    deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                                    deleteButton.textContent = 'Remove';
                                    deleteButton.name = 'dele';

                                    // Add a click event listener to the delete button
                                    let videoId = attachment.id;
                                    deleteButton.addEventListener('click', function () {
                                        deleted.push(videoId + "");
                                        // Remove the row when the delete button is clicked
                                        tableBody.removeChild(newRow);
                                    });

                                    // Append the delete button to the action cell
                                    actionCell.appendChild(deleteButton);
                                });


                                // Show the form section
                                $('#saveBtnclr').data('mode', 'update-fileclear');
                                $('#saveBtnclr').data('id', id);
                                $('#saveBtnclr').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionFileClearance').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Undertaking Recommendation') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');

                    // Fetch team and attachment details
                    fetch('fmr/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberrec').val(content.ref_number);
                                $('#customer_namerec').val(content.customer_name);
                                $('#amountrec').val(content.amount);
                                $('#productrec').val(product.product_txt);
                                console.log(data.product_txt);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttsrec tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttsrec tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date;

                                });


                                // Show the form section
                                $('#saveBtnrec').data('mode', 'update-Recommendation');
                                $('#saveBtnrec').data('id', id);
                                $('#saveBtnrec').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionRecommendation').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Undertaking Approval Pending') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');


                    fetch('fmr/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberu').val(content.ref_number);
                                $('#customer_nameu').val(content.customer_name);
                                $('#amountu').val(content.amount);
                                $('#productu').val(product.product_txt);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttu tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttu tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date;


                                });

                                // Show the form section
                                $('#saveBtnund').data('mode', 'update-undertaking');
                                $('#saveBtnund').data('id', id);
                                $('#saveBtnund').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionApprovalPending').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Payment Voucher Hand Over To Finance') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberpay').val(content.ref_number);
                                $('#customer_namepay').val(content.customer_name);
                                $('#amountpay').val(content.amount);
                                $('#productpay').val(product.product_txt);
                                $('#saveBtnpay').data('mode', 'update-payment');
                                $('#saveBtnpay').data('id', id);
                                $('#saveBtnpay').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionPaymentVoucher').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Payment Voucher Hand Over To Finance(Undertaking Approval)') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {

                                let data = resp.data;
                                let content = resp.data.content;
                                let approve = resp.data.approverData;
                                let product = resp.data.productData;


                                $('#ref_numberppun').val(content.ref_number);
                                $('#customer_nameppun').val(content.customer_name);
                                $('#amountppun').val(content.amount);
                                $('#productppun').val(product.product_txt);
                                $('#approvername').val(approve.approvername);


                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttpay tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttpay tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);
                                    var actionCell = newRow.insertCell(6);

                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date; // Assuming modifiedOn is available in attachment object

                                    // Create a delete button in the action cell
                                    var deleteButton = document.createElement('button');
                                    deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                                    deleteButton.textContent = 'Remove';
                                    deleteButton.name = 'dele';

                                    // Add a click event listener to the delete button
                                    let videoId = attachment.id;
                                    deleteButton.addEventListener('click', function () {
                                        deleted.push(videoId + "");
                                        // Remove the row when the delete button is clicked
                                        tableBody.removeChild(newRow);
                                    });

                                    // Append the delete button to the action cell
                                    actionCell.appendChild(deleteButton);
                                });

                                $('#saveBtnppun').data('mode', 'update-payunder');
                                $('#saveBtnppun').data('id', id);
                                $('#saveBtnppun').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionPaymentVoucherUnder').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Completed') {
                    loadDiv($('#tableSection'));

                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/paymentv-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let obj = data.obj;


                                $('#ref_numbercom').val(obj.ref_number);
                                $('#customer_namecom').val(obj.customer_name);
                                $('#amountcom').val(obj.amount);
                                $('#productcom').val(d1.product_txt);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionCompleted').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                } else if (status === 'Completed(Undertaking Approval)') {
                    loadDiv($('#tableSection'));

                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/paymentv-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let d2 = data.d2;
                                let obj = data.obj;


                                $('#ref_numbercomund').val(obj.ref_number);
                                $('#customer_namecomund').val(obj.customer_name);
                                $('#amountcomund').val(obj.amount);
                                $('#productcomund').val(d1.product_txt);
                                $('#approvercomund').val(d2.approvername);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionCompletedUndertaking').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                } else if (status === 'Rejected') {
                    loadDiv($('#tableSection'));


                    let id = $(this).parents('tr').data('id');
                    fetch('fmr/paymentv-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let obj = data.obj;


                                $('#ref_numberrej').val(obj.ref_number);
                                $('#customer_namerej').val(obj.customer_name);
                                $('#amountrej').val(obj.amount);
                                $('#productrej').val(d1.product_txt);
                                $('#resonrej').val(obj.reason);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionRejected').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                }

            });
        </script>

        <!--File Pending Details-->
        <script>
            document.getElementById('addBtnFile').addEventListener('click', function () {
                // Get the table body
                var tableBody = document.querySelector('#tbladdAtt tbody');

                // Create a new row
                var newRow = tableBody.insertRow();

                // Create cells in the new row
                var fileNameCell = newRow.insertCell(0);
                var justificationCell = newRow.insertCell(1);
                var completionDateCell = newRow.insertCell(2);
                var actionCell = newRow.insertCell(3);

                // Create input for "Pending Files" in cell 1
                var fileNameInput = document.createElement('input');
                fileNameInput.type = 'text';
                fileNameInput.name = 'fileName';
                fileNameInput.classList.add('form-control');
                fileNameInput.required = true;
                fileNameInput.autocomplete = 'off';

                // Create input for "Justification" in cell 2
                var justificationInput = document.createElement('input');
                justificationInput.type = 'text';
                justificationInput.name = 'justification';
                justificationInput.classList.add('form-control');
                justificationInput.required = true;
                justificationInput.autocomplete = 'off';

                // Create input for "Completion Date" in cell 3
                var completionDateInput = document.createElement('input');
                completionDateInput.type = 'date';
                completionDateInput.name = 'completionDate';
                completionDateInput.classList.add('form-control');
                completionDateInput.required = true;

                // Append input elements to respective cells
                fileNameCell.appendChild(fileNameInput);
                justificationCell.appendChild(justificationInput);
                completionDateCell.appendChild(completionDateInput);

                // Create a delete button in the action cell
                var deleteButton = document.createElement('button');
                deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                deleteButton.textContent = 'Remove';
                deleteButton.name = 'dele';

                // Add a click event listener to the delete button
                deleteButton.addEventListener('click', function () {
                    // Remove the row when the delete button is clicked
                    tableBody.removeChild(newRow);
                });

                // Append the delete button to the action cell
                actionCell.appendChild(deleteButton);
            });




            document.getElementById('saveBtnfile').addEventListener('click', function () {
                let mode = $('#saveBtnfile').data('mode');
                if (mode === 'update-filepending') {
                    let id = $('#saveBtnfile').data('id');
                    let tableRows = document.querySelectorAll('#tbladdAtt tbody tr');
                    let attachmentData = [];
                    let formData = {};

                    tableRows.forEach((row) => {
                        let fileName = row.querySelector('input[name="fileName"]').value;
                        let justification = row.querySelector('input[name="justification"]').value;
                        let completionDate = row.querySelector('input[name="completionDate"]').value;

                        attachmentData.push({
                            name: fileName,
                            justification: justification,
                            completionDate: completionDate
                        });
                    });

                    let desclist = JSON.stringify(attachmentData);
                    let statusack = document.getElementById('statusack').value;

                    // Add statusack and desclist to formData
                    formData.statusack = statusack;
                    formData.desclist = desclist;
                    formData.id = id;

                    fetch('fmr/save-filePendings', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Pending Files have been successfully saved', 'success');
                            clearForms();
                            $('#formSectionFilePending').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                            clearForms();
                        }
                        return response.json();
                    }).catch(error => {
                        Swal.fire('Error!', error.message, 'error');
                    });
                }
            });

            function clearForms() {

                // Clear table rows
                var tableBody = document.querySelector('#tbladdAtt tbody');
                tableBody.innerHTML = '';
            }
            function clearFormsf() {

                // Clear table rows
                var tableBody = document.querySelector('#tbladdAtts tbody');
                tableBody.innerHTML = '';
            }
            function clearFormsu() {

                // Clear table rows
                var tableBody = document.querySelector('#tbladdAttu tbody');
                tableBody.innerHTML = '';
            }
        </script>

        <!--Exceptions-->
        <script>
            function handleAttachmentDeletion() {
                let deleteIds = [];

                $('#tbladdAtts').on('click', '.btn-danger', function () {
                    let deleteRowId = $(this).closest('tr').attr('id');
                    deleteIds.push(deleteRowId);
                    $(this).closest('tr').remove();
                });

                return deleteIds;
            }

            let deleted = [];
            $(document).on('click', '.editrecfileclr', function () {

            });
            document.getElementById('saveBtnclr').addEventListener('click', function () {
                let mode = $('#saveBtnclr').data('mode');
                if (mode === 'update-fileclear') {
                    let id = $('#saveBtnclr').data('id');//
                    let deleteIds = handleAttachmentDeletion();
                    let tableRows = document.querySelectorAll('#tbladdAtts tbody tr');
                    let attachmentData = [];
                    let formData = {};

                    tableRows.forEach((row, index) => {
                        let fileNameInput = row.querySelector('input[name="fileName"]');
                        if (fileNameInput) {
                            let fileName = fileNameInput.value;

                            attachmentData.push({
                                name: fileName
                            });
                        }
                    });

                    let desclist = JSON.stringify(attachmentData);

                    formData.desclist = desclist;
                    formData.id = id;
                    formData.deleteIds = JSON.stringify(deleted);

                    // Get the selected value of statusclr
                    let statusclr = document.getElementById('statusclr').value;

                    // Add statusclr to formData
                    formData.statusclr = statusclr;

                    fetch('fmr/update-fileclearance', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Pending File details updated successfully', 'success');
                            clearFormsf();
                            $('#formSectionFileClearance').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    }).catch(error => {
                        console.error('Error updating Pending File details:', error);
                        Swal.fire('Error!', 'Failed to update Pending File details', 'error');
                    });
                }
            });

        </script>


        <!--Undertaking recommendation-->
        <script>
            document.getElementById('saveBtnrec').addEventListener('click', function () {
                let mode = $('#saveBtnrec').data('mode');
                if (mode === 'update-Recommendation') {
                    let id = $('#saveBtnrec').data('id');

                    let approver = document.getElementById('approver').value;

                    // Ensure formData is properly defined and initialized
                    let formData = {
                        id: id,
                        approver: approver
                    };

                    fetch('fmr/update-recommendation', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        }
                        return response.json(); // Move this line here to parse JSON
                    }).then(data => {
                        Swal.fire('Successful!', 'Pending File details updated successfully', 'success');
                        clearFormsf();
                        $('#formSectionRecommendation').hide();
                        $('#tableSection').fadeIn();
                        dtable.ajax.reload();
                    }).catch(error => {
                        console.error('Error updating Pending File details:', error);
                        Swal.fire('Error!', 'Failed to update Pending File details', 'error');
                    });
                }
            });




            document.addEventListener("DOMContentLoaded", function () {
                var clearanceStatusSelect = document.getElementById("statusclr");
                var approveSelect = document.getElementById("approve_section");

                // Add event listener to the select element
                clearanceStatusSelect.addEventListener("change", function () {
                    // Check if the selected value is "approve"
                    if (this.value === "approve") {
                        // Show the comment section
                        approveSelect.style.display = "block";
                    } else {
                        // Hide the comment section
                        approveSelect.style.display = "none";
                    }
                });
            });
            var approv = new SlimSelect(
                    {select: '#approver',
                        placeholder: "Select Approver",
                        ajax: function (search, callback) {
                            fetch('fmr/approver', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });



            document.getElementById('addBtnClr').addEventListener('click', function () {
                // Get the table body
                var tableBody = document.querySelector('#tbladdAtts tbody');

                // Create a new row
                var newRow = tableBody.insertRow();

                // Create cells in the new row
                var fileNameCell = newRow.insertCell(0);
                var actionCell = newRow.insertCell(1);

                // Create input for "File Name" in cell 1
                var fileNameInput = document.createElement('input');
                fileNameInput.type = 'text';
                fileNameInput.name = 'fileName';
                fileNameInput.classList.add('form-control');
                fileNameInput.required = true;
                fileNameInput.autocomplete = 'off';


                // Append input elements to respective cells
                fileNameCell.appendChild(fileNameInput);

                // Create a delete button in the action cell
                var deleteButton = document.createElement('button');
                deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                deleteButton.textContent = 'Remove';
                deleteButton.name = 'dele';

                // Add a click event listener to the delete button
                deleteButton.addEventListener('click', function () {
                    // Remove the row when the delete button is clicked
                    tableBody.removeChild(newRow);
                });

                // Append the delete button to the action cell
                actionCell.appendChild(deleteButton);

                // Call the addAttachmentRow function with the input values
                //                addAttachmentRow(fileNameInput.value);
            });



        </script>

        <!--Undertaking Approval Pending-->
        <script>
            document.getElementById('saveBtnund').addEventListener('click', function () {
                let mode = $('#saveBtnund').data('mode');
                if (mode === 'update-undertaking') {
                    let id = $('#saveBtnund').data('id');//

                    let formData = {};
                    formData.id = id;

                    // Get the selected value of statusund
                    let statusund = document.getElementById('statusund').value;

                    // Add statusclr to formData
                    formData.statusund = statusund;


                    fetch('fmr/update-undertakingap', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Undertaking Approval details updated successfully', 'success');
                            clearFormsu();
                            $('#formSectionApprovalPending').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    }).catch(error => {
                        console.error('Error updating Undertaking Approval details:', error);
                        Swal.fire('Error!', 'Failed to update Undertaking Approval details', 'error');
                    });
                }
            });
        </script>

        <!--Payment Voucher Hand Over To finance -->
        <script>

            document.getElementById('saveBtnpay').addEventListener('click', function () {
                let mode = $('#saveBtnpay').data('mode');
                if (mode === 'update-payment') {
                    let id = $('#saveBtnpay').data('id');//

                    let formData = {};
                    formData.id = id;

                    // Get the selected value of statusund
                    let statusvoucher = document.getElementById('statusvoucher').value;

                    // Add statusclr to formData
                    formData.statusvoucher = statusvoucher;


                    fetch('fmr/update-payvoucher', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Payment Voucher Hand Over details updated successfully', 'success');
                            clearFormsu();
                            $('#formSectionPaymentVoucher').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    }).catch(error => {
                        console.error('Error updating Payment Voucher Hand Over details:', error);
                        Swal.fire('Error!', 'Failed to update Payment Voucher Hand Over details', 'error');
                    });
                }
            });



        </script>

        <!--Payment Undertaking-->
        <script>

            function handleAttachmentDeletion() {
                let deleteIds = [];

                $('#tbladdAttpay').on('click', '.btn-danger', function () {
                    let deleteRowId = $(this).closest('tr').attr('id');
                    deleteIds.push(deleteRowId);
                    $(this).closest('tr').remove();
                });

                return deleteIds;
            }


            document.getElementById('saveBtnppun').addEventListener('click', function () {
                let mode = $('#saveBtnppun').data('mode');
                if (mode === 'update-payunder') {
                    let id = $('#saveBtnppun').data('id');//
                    let deleteIds = handleAttachmentDeletion();
                    let tableRows = document.querySelectorAll('#tbladdAtts tbody tr');
                    let attachmentData = [];
                    let formData = {};

                    tableRows.forEach((row, index) => {
                        let fileNameInput = row.querySelector('input[name="fileName"]');
                        if (fileNameInput) {
                            let fileName = fileNameInput.value;

                            attachmentData.push({
                                name: fileName
                            });
                        }
                    });

                    let desclist = JSON.stringify(attachmentData);

                    formData.desclist = desclist;
                    formData.id = id;
                    formData.deleteIds = JSON.stringify(deleted);

                    // Get the selected value of statusclr
                    let statusvoucherun = document.getElementById('statusvoucherun').value;

                    // Add statusclr to formData
                    formData.statusvoucherun = statusvoucherun;



                    fetch('fmr/update-payment-undertaking', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Pending File details updated successfully', 'success');
                            clearFormsf();
                            $('#formSectionPaymentVoucherUnder').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    }).catch(error => {
                        console.error('Error updating Pending File details:', error);
                        Swal.fire('Error!', 'Failed to update Pending File details', 'error');
                    });
                }
            });

        </script>


    </body>
</html>