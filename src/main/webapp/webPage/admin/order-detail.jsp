<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <!-- Title Meta -->
     <meta charset="utf-8" />
     <title>Order Details | Larkon - Responsive Admin Dashboard Template</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="A fully responsive premium admin dashboard template" />
     <meta name="author" content="Techzaa" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />

     <!-- App favicon -->
     <link rel="shortcut icon" href="../webPage/admin/assets/images/favicon.ico">

     <!-- Vendor css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/vendor.min.css" rel="stylesheet" type="text/css" />

     <!-- Icons css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

     <!-- App css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/app.min.css" rel="stylesheet" type="text/css" />

     <!-- Theme Config js (Require in all Page) -->
     <script src="../webPage/admin/assets/js/config.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
     
</head>

<body>

     <!-- START Wrapper -->
     <div class="wrapper">

          <!-- ========== Topbar Start ========== -->
	<jsp:include page="/webPage/admin/header.jsp"></jsp:include>
          <!-- Activity Timeline -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-activity-offcanvas" style="max-width: 450px; width: 100%;">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar class="h-100 p-4">
                              <div class="position-relative ms-2">
                                   <span class="position-absolute start-0  top-0 border border-dashed h-100"></span>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:folder-check-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Report-Fix / Update </h5>
                                                  <p class="d-flex align-items-center">Add 3 files to <span class=" d-flex align-items-center text-primary ms-1"><iconify-icon icon="iconamoon:file-light"></iconify-icon> Tasks</span></p>
                                                  <div class="bg-light bg-opacity-50 rounded-2 p-2">
                                                       <div class="row">
                                                            <div class="col-lg-6 border-end border-light">
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <i class="bx bxl-figma fs-20 text-red"></i>
                                                                      <a href="#!" class="text-dark fw-medium">Concept.fig</a>
                                                                 </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <i class="bx bxl-file-doc fs-20 text-success"></i>
                                                                      <a href="#!" class="text-dark fw-medium">larkon.docs</a>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                                  <h6 class="mt-2 text-muted">Monday , 4:24 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:check-circle-1-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Project Status
                                                  </h5>
                                                  <p class="d-flex align-items-center mb-0">Marked<span class=" d-flex align-items-center text-primary mx-1"><iconify-icon icon="iconamoon:file-light"></iconify-icon> Design </span> as <span class="badge bg-success-subtle text-success px-2 py-1 ms-1"> Completed</span></p>
                                                  <div class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
                                                       <a href="#!" class="fw-medium text-dark">UI/UX Figma Design</a>
                                                       <div class="ms-auto">
                                                            <a href="#!" class="fw-medium text-primary fs-18" data-bs-toggle="tooltip" data-bs-title="Download" data-bs-placement="bottom"><iconify-icon icon="iconamoon:cloud-download-duotone"></iconify-icon></a>
                                                       </div>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday , 3:00 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16">UI</span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15">Larkon Application UI v2.0.0 <span class="badge bg-primary-subtle text-primary px-2 py-1 ms-1"> Latest</span>
                                                  </h5>
                                                  <p>Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and pre-order E-commerce & Marketing pages.</p>
                                                  <div class="mt-2">
                                                       <a href="#!" class="btn btn-light btn-sm">Download Zip</a>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday , 2:10 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img src="../webPage/admin/assets/images/users/avatar-7.jpg" alt="avatar-5" class="avatar-sm rounded-circle"></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Alex Smith Attached Photos
                                                  </h5>
                                                  <div class="row g-2 mt-2">
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-6.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday 1:00 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img src="../webPage/admin/assets/images/users/avatar-6.jpg" alt="avatar-5" class="avatar-sm rounded-circle"></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Rebecca J. added a new team member
                                                  </h5>
                                                  <p class="d-flex align-items-center gap-1"><iconify-icon icon="iconamoon:check-circle-1-duotone" class="text-success"></iconify-icon> Added a new member to Front Dashboard</p>
                                                  <h6 class="mt-3 text-muted">Monday 10:00 AM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:certificate-badge-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Achievements
                                                  </h5>
                                                  <p class="d-flex align-items-center gap-1 mt-1">Earned a <iconify-icon icon="iconamoon:certificate-badge-duotone" class="text-danger fs-20"></iconify-icon>" Best Product Award"</p>
                                                  <h6 class="mt-3 text-muted">Monday 9:30 AM</h6>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <a href="#!" class="btn btn-outline-dark w-100">View All</a>
                         </div>
                    </div>
               </div>
          </div>

          <!-- Right Sidebar (Theme Settings) -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-settings-offcanvas">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0">Theme Settings</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar class="h-100">
                              <div class="p-3 settings-bar">

                                   <div>
                                        <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-light" value="light">
                                             <label class="form-check-label" for="layout-color-light">Light</label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                                             <label class="form-check-label" for="layout-color-dark">Dark</label>
                                        </div>
                                   </div>

                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-light" value="light">
                                             <label class="form-check-label" for="topbar-color-light">Light</label>
                                        </div>
                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                             <label class="form-check-label" for="topbar-color-dark">Dark</label>
                                        </div>
                                   </div>


                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-light" value="light">
                                             <label class="form-check-label" for="leftbar-color-light">
                                                  Light
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                             <label class="form-check-label" for="leftbar-color-dark">
                                                  Dark
                                             </label>
                                        </div>
                                   </div>

                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-default" value="default">
                                             <label class="form-check-label" for="leftbar-size-default">
                                                  Default
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small" value="condensed">
                                             <label class="form-check-label" for="leftbar-size-small">
                                                  Condensed
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-hidden" value="hidden">
                                             <label class="form-check-label" for="leftbar-hidden">
                                                  Hidden
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small-hover-active" value="sm-hover-active">
                                             <label class="form-check-label" for="leftbar-size-small-hover-active">
                                                  Small Hover Active
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small-hover" value="sm-hover">
                                             <label class="form-check-label" for="leftbar-size-small-hover">
                                                  Small Hover
                                             </label>
                                        </div>
                                   </div>

                              </div>
                         </div>
                    </div>
                    <div class="offcanvas-footer border-top p-3 text-center">
                         <div class="row">
                              <div class="col">
                                   <button type="button" class="btn btn-danger w-100" id="reset-layout">Reset</button>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
          <!-- ========== Topbar End ========== -->

          <!-- ========== App Menu Start ========== -->
          <jsp:include page="/webPage/admin/main-nav.jsp"></jsp:include>
          <!-- ========== App Menu End ========== -->

          <!-- ==================================================== -->
          <!-- Start right Content here -->
          <!-- ==================================================== -->

          <div class="page-content">

               <!-- Start Container -->
               <div class="container-xxl">

                    <div class="row">
                         <div class="col-xl-9 col-lg-8">
                              <div class="row">
                                   <div class="col-lg-12">
                                        <div class="card">
                                             <div class="card-body">
                                                  <div class="d-flex flex-wrap align-items-center justify-content-between gap-2">
                                                       <div>
                                                            <h4 class="fw-medium text-dark d-flex align-items-center gap-2">#0758267/90 <span class="badge bg-success-subtle text-success  px-2 py-1 fs-13">Paid</span><span class="border border-warning text-warning fs-13 px-2 py-1 rounded">In Progress</span></h4>
                                                            <p class="mb-0">Order / Order Details / #0758267/90 - April 23 , 2024 at 6:23 pm</p>
                                                       </div>
                                                       <div>
                                                            <a href="#!" class="btn btn-outline-secondary">Refund</a>
                                                            <a href="#!" class="btn btn-outline-secondary">Return</a>
                                                            <a href="#!" class="btn btn-primary">Edit Order</a>
                                                       </div>

                                                  </div>

                                                  <div class="mt-4">
                                                       <h4 class="fw-medium text-dark">Progress</h4>
                                                  </div>
                                                  <div class="row row-cols-xxl-5 row-cols-md-2 row-cols-1">
                                                       <div class="col">
                                                            <div class="progress mt-3" style="height: 10px;">
                                                                 <div class="progress-bar progress-bar  progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="70">
                                                                 </div>
                                                            </div>
                                                            <p class="mb-0 mt-2">Order Confirming</p>
                                                       </div>
                                                       <div class="col">
                                                            <div class="progress mt-3" style="height: 10px;">
                                                                 <div class="progress-bar progress-bar  progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="70">
                                                                 </div>
                                                            </div>
                                                            <p class="mb-0 mt-2">Payment Pending</p>
                                                       </div>
                                                       <div class="col">
                                                            <div class="progress mt-3" style="height: 10px;">
                                                                 <div class="progress-bar progress-bar  progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 60%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="70">
                                                                 </div>
                                                            </div>
                                                            <div class="d-flex align-items-center gap-2 mt-2">
                                                                 <p class="mb-0">Processing</p>
                                                                 <div class="spinner-border spinner-border-sm text-warning" role="status">
                                                                      <span class="visually-hidden">Loading...</span>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="col">
                                                            <div class="progress mt-3" style="height: 10px;">
                                                                 <div class="progress-bar progress-bar  progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 0%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="70">
                                                                 </div>
                                                            </div>
                                                            <p class="mb-0 mt-2">Shipping</p>
                                                       </div>
                                                       <div class="col">
                                                            <div class="progress mt-3" style="height: 10px;">
                                                                 <div class="progress-bar progress-bar  progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 0%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="70">
                                                                 </div>
                                                            </div>
                                                            <p class="mb-0 mt-2">Delivered</p>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div class="card-footer d-flex flex-wrap align-items-center justify-content-between bg-light-subtle gap-2">
                                                  <p class="border rounded mb-0 px-2 py-1 bg-body"><i class='bx bx-arrow-from-left align-middle fs-16'></i> Estimated shipping date : <span class="text-dark fw-medium">Apr 25 , 2024</span></p>
                                                  <div>
                                                       <a href="#!" class="btn btn-primary">Make As Ready To Ship</a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card">
                                             <div class="card-header">
                                                  <h4 class="card-title">Product</h4>
                                             </div>
                                             <div class="card-body">
                                                  <div class="table-responsive">
                                                       <table class="table align-middle mb-0 table-hover table-centered">
                                                            <thead class="bg-light-subtle border-bottom">
                                                                 <tr>
                                                                      <th>Product Name & Size</th>
                                                                      <th>Status</th>
                                                                      <th>Quantity</th>
                                                                      <th>Price</th>
                                                                      <th>Text</th>
                                                                      <th>Amount</th>
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                                 <tr>
                                                                      <td>
                                                                           <div class="d-flex align-items-center gap-2">
                                                                                <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                                     <img src="../webPage/admin/assets/images/product/p-1.png" alt="" class="avatar-md">
                                                                                </div>
                                                                                <div>
                                                                                     <a href="#!" class="text-dark fw-medium fs-15">Men Black Slim Fit T-shirt</a>
                                                                                     <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>M</p>
                                                                                </div>
                                                                           </div>

                                                                      </td>

                                                                      <td>
                                                                           <span class="badge bg-success-subtle text-success  px-2 py-1 fs-13">Ready</span>
                                                                      </td>
                                                                      <td> 1</td>
                                                                      <td>$80.00</td>
                                                                      <td> $3.00</td>
                                                                      <td>
                                                                           $83.00
                                                                      </td>
                                                                 </tr>


                                                                 <tr>
                                                                      <td>
                                                                           <div class="d-flex align-items-center gap-2">
                                                                                <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                                     <img src="../webPage/admin/assets/images/product/p-5.png" alt="" class="avatar-md">
                                                                                </div>
                                                                                <div>
                                                                                     <a href="#!" class="text-dark fw-medium fs-15">Dark Green Cargo Pent</a>
                                                                                     <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>M</p>
                                                                                </div>
                                                                           </div>

                                                                      </td>

                                                                      <td>
                                                                           <span class="badge bg-light text-dark  px-2 py-1 fs-13">Packaging</span>
                                                                      </td>
                                                                      <td> 3</td>
                                                                      <td>$330.00</td>
                                                                      <td> $4.00</td>
                                                                      <td>
                                                                           $334.00
                                                                      </td>
                                                                 </tr>

                                                                 <tr>
                                                                      <td>
                                                                           <div class="d-flex align-items-center gap-2">
                                                                                <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                                     <img src="../webPage/admin/assets/images/product/p-8.png" alt="" class="avatar-md">
                                                                                </div>
                                                                                <div>
                                                                                     <a href="#!" class="text-dark fw-medium fs-15">Men Dark Brown Wallet</a>
                                                                                     <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S</p>
                                                                                </div>
                                                                           </div>

                                                                      </td>

                                                                      <td>
                                                                           <span class="badge bg-success-subtle text-success  px-2 py-1 fs-13">Ready</span>
                                                                      </td>
                                                                      <td> 1</td>
                                                                      <td>$132.00</td>
                                                                      <td> $5.00</td>
                                                                      <td>
                                                                           $137.00
                                                                      </td>
                                                                 </tr>

                                                                 <tr>
                                                                      <td>
                                                                           <div class="d-flex align-items-center gap-2">
                                                                                <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                                     <img src="../webPage/admin/assets/images/product/p-10.png" alt="" class="avatar-md">
                                                                                </div>
                                                                                <div>
                                                                                     <a href="#!" class="text-dark fw-medium fs-15">Kid's Yellow T-shirt</a>
                                                                                     <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S </p>
                                                                                </div>
                                                                           </div>

                                                                      </td>

                                                                      <td>
                                                                           <span class="badge bg-light text-dark  px-2 py-1 fs-13">Packaging</span>
                                                                      </td>
                                                                      <td> 2</td>
                                                                      <td>$220.00</td>
                                                                      <td> $3.00</td>
                                                                      <td>
                                                                           $223.00
                                                                      </td>
                                                                 </tr>
                                                            </tbody>
                                                       </table>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card">
                                             <div class="card-header">
                                                  <h4 class="card-title">Order Timeline</h4>
                                             </div>
                                             <div class="card-body">
                                                  <div class="position-relative ms-2">
                                                       <span class="position-absolute start-0  top-0 border border-dashed h-100"></span>
                                                       <div class="position-relative ps-4">
                                                            <div class="mb-4">
                                                                 <span class="position-absolute start-0 avatar-sm translate-middle-x bg-light d-inline-flex align-items-center justify-content-center rounded-circle">
                                                                      <div class="spinner-border spinner-border-sm text-warning" role="status">
                                                                           <span class="visually-hidden">Loading...</span>
                                                                      </div>
                                                                 </span>
                                                                 <div class="ms-2 d-flex flex-wrap gap-2 align-items-center justify-content-between">
                                                                      <div>
                                                                           <h5 class="mb-1 text-dark fw-medium fs-15">The packing has been started</h5>
                                                                           <p class="mb-0">Confirmed by Gaston Lapierre</p>
                                                                      </div>
                                                                      <p class="mb-0">April 23, 2024, 09:40 am</p>

                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="position-relative ps-4">
                                                            <div class="mb-4">
                                                                 <span class="position-absolute start-0 avatar-sm translate-middle-x bg-light d-inline-flex align-items-center justify-content-center rounded-circle text-success fs-20">
                                                                      <i class='bx bx-check-circle'></i>
                                                                 </span>
                                                                 <div class="ms-2 d-flex flex-wrap gap-2  align-items-center justify-content-between">
                                                                      <div>
                                                                           <h5 class="mb-1 text-dark fw-medium fs-15">The Invoice has been sent to the customer</h5>
                                                                           <p class="mb-2">Invoice email was sent to <a href="#!" class="link-primary">hello@dundermuffilin.com</a></p>
                                                                           <a href="#!" class="btn btn-light">Resend Invoice</a>
                                                                      </div>
                                                                      <p class="mb-0">April 23, 2024, 09:40 am</p>

                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="position-relative ps-4">
                                                            <div class="mb-4">
                                                                 <span class="position-absolute start-0 avatar-sm translate-middle-x bg-light d-inline-flex align-items-center justify-content-center rounded-circle text-success fs-20">
                                                                      <i class='bx bx-check-circle'></i>
                                                                 </span>
                                                                 <div class="ms-2 d-flex flex-wrap gap-2 align-items-center justify-content-between">
                                                                      <div>
                                                                           <h5 class="mb-1 text-dark fw-medium fs-15">The Invoice has been created</h5>
                                                                           <p class="mb-2">Invoice created by Gaston Lapierre</p>
                                                                           <a href="#!" class="btn btn-primary">Download Invoice</a>
                                                                      </div>
                                                                      <p class="mb-0">April 23, 2024, 09:40 am</p>

                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="position-relative ps-4">
                                                            <div class="mb-4">
                                                                 <span class="position-absolute start-0 avatar-sm translate-middle-x bg-light d-inline-flex align-items-center justify-content-center rounded-circle text-success fs-20">
                                                                      <i class='bx bx-check-circle'></i>
                                                                 </span>
                                                                 <div class="ms-2 d-flex flex-wrap gap-2 align-items-center justify-content-between">
                                                                      <div>
                                                                           <h5 class="mb-1 text-dark fw-medium fs-15">Order Payment</h5>
                                                                           <p class="mb-2">Using Master Card</p>
                                                                           <div class="d-flex align-items-center gap-2">
                                                                                <p class="mb-1 text-dark fw-medium">Status :</p>
                                                                                <span class="badge bg-success-subtle text-success  px-2 py-1 fs-13">Paid</span>
                                                                           </div>
                                                                      </div>
                                                                      <p class="mb-0">April 23, 2024, 09:40 am</p>

                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="position-relative ps-4">
                                                            <div class="mb-2">
                                                                 <span class="position-absolute start-0 avatar-sm translate-middle-x bg-light d-inline-flex align-items-center justify-content-center rounded-circle text-success fs-20">
                                                                      <i class='bx bx-check-circle'></i>
                                                                 </span>
                                                                 <div class="ms-2 d-flex flex-wrap gap-2  align-items-center justify-content-between">
                                                                      <div>
                                                                           <h5 class="mb-2 text-dark fw-medium fs-15">4 Order conform by Gaston Lapierre</h5>
                                                                           <a href="#!" class="badge bg-light text-dark fw-normal  px-2 py-1 fs-13">Order 1</a>
                                                                           <a href="#!" class="badge bg-light text-dark fw-normal  px-2 py-1 fs-13">Order 2</a>
                                                                           <a href="#!" class="badge bg-light text-dark fw-normal  px-2 py-1 fs-13">Order 3</a>
                                                                           <a href="#!" class="badge bg-light text-dark fw-normal  px-2 py-1 fs-13">Order 4</a>
                                                                      </div>
                                                                      <p class="mb-0">April 23, 2024, 09:40 am</p>

                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card bg-light-subtle">
                                             <div class="card-body">
                                                  <div class="row g-3 g-lg-0">
                                                       <div class="col-lg-3 border-end">
                                                            <div class="d-flex align-items-center gap-3 justify-content-between px-3">
                                                                 <div>
                                                                      <p class="text-dark fw-medium fs-16 mb-1">Vender</p>
                                                                      <p class="mb-0">Catpiller</p>
                                                                 </div>
                                                                 <div class="avatar bg-light d-flex align-items-center justify-content-center rounded">
                                                                      <iconify-icon icon="solar:shop-2-bold-duotone" class="fs-35 text-primary"></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="col-lg-3 border-end">
                                                            <div class="d-flex align-items-center gap-3 justify-content-between px-3">
                                                                 <div>
                                                                      <p class="text-dark fw-medium fs-16 mb-1">Date</p>
                                                                      <p class="mb-0">April 23 , 2024</p>
                                                                 </div>
                                                                 <div class="avatar bg-light d-flex align-items-center justify-content-center rounded">
                                                                      <iconify-icon icon="solar:calendar-date-bold-duotone" class="fs-35 text-primary"></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="col-lg-3 border-end">
                                                            <div class="d-flex align-items-center gap-3 justify-content-between px-3">
                                                                 <div>
                                                                      <p class="text-dark fw-medium fs-16 mb-1">Paid By</p>
                                                                      <p class="mb-0">Gaston Lapierre</p>
                                                                 </div>
                                                                 <div class="avatar bg-light d-flex align-items-center justify-content-center rounded">
                                                                      <iconify-icon icon="solar:user-circle-bold-duotone" class="fs-35 text-primary"></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="col-lg-3">
                                                            <div class="d-flex align-items-center gap-3 justify-content-between px-3">
                                                                 <div>
                                                                      <p class="text-dark fw-medium fs-16 mb-1">Reference #IMEMO</p>
                                                                      <p class="mb-0">#0758267/90</p>
                                                                 </div>
                                                                 <div class="avatar bg-light d-flex align-items-center justify-content-center rounded">
                                                                      <iconify-icon icon="solar:clipboard-text-bold-duotone" class="fs-35 text-primary"></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="col-xl-3 col-lg-4">
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Order Summary</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="table-responsive">
                                             <table class="table mb-0">
                                                  <tbody>
                                                       <tr>
                                                            <td class="px-0">
                                                                 <p class="d-flex mb-0 align-items-center gap-1"><iconify-icon icon="solar:clipboard-text-broken"></iconify-icon> Sub Total : </p>
                                                            </td>
                                                            <td class="text-end text-dark fw-medium px-0">$777.00</td>
                                                       </tr>
                                                       <tr>
                                                            <td class="px-0">
                                                                 <p class="d-flex mb-0 align-items-center gap-1"><iconify-icon icon="solar:ticket-broken" class="align-middle"></iconify-icon> Discount : </p>
                                                            </td>
                                                            <td class="text-end text-dark fw-medium px-0">-$60.00</td>
                                                       </tr>
                                                       <tr>
                                                            <td class="px-0">
                                                                 <p class="d-flex mb-0 align-items-center gap-1"><iconify-icon icon="solar:kick-scooter-broken" class="align-middle"></iconify-icon> Delivery Charge : </p>
                                                            </td>
                                                            <td class="text-end text-dark fw-medium px-0">$00.00</td>
                                                       </tr>
                                                       <tr>
                                                            <td class="px-0">
                                                                 <p class="d-flex mb-0 align-items-center gap-1"><iconify-icon icon="solar:calculator-minimalistic-broken" class="align-middle"></iconify-icon> Estimated Tax (15.5%) : </p>
                                                            </td>
                                                            <td class="text-end text-dark fw-medium px-0">$20.00</td>
                                                       </tr>

                                                  </tbody>
                                             </table>
                                        </div>
                                   </div>
                                   <div class="card-footer d-flex align-items-center justify-content-between bg-light-subtle">
                                        <div>
                                             <p class="fw-medium text-dark mb-0">Total Amount</p>
                                        </div>
                                        <div>
                                             <p class="fw-medium text-dark mb-0">$737.00</p>
                                        </div>

                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Payment Information</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-3 mb-3">
                                             <div class="rounded-3 bg-light avatar d-flex align-items-center justify-content-center">
                                                  <img src="../webPage/admin/assets/images/card/mastercard.svg" alt="" class="avatar-sm">
                                             </div>
                                             <div>
                                                  <p class="mb-1 text-dark fw-medium">Master Card</p>
                                                  <p class="mb-0 text-dark">xxxx xxxx xxxx 7812</p>
                                             </div>
                                             <div class="ms-auto">
                                                  <iconify-icon icon="solar:check-circle-broken" class="fs-22 text-success"></iconify-icon>
                                             </div>
                                        </div>
                                        <p class="text-dark mb-1 fw-medium">Transaction ID : <span class="text-muted fw-normal fs-13"> #IDN768139059</span></p>
                                        <p class="text-dark mb-0 fw-medium">Card Holder Name : <span class="text-muted fw-normal fs-13"> Gaston Lapierre</span></p>

                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Customer Details</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2">
                                             <img src="../webPage/admin/assets/images/users/avatar-1.jpg" alt="" class="avatar rounded-3 border border-light border-3">
                                             <div>
                                                  <p class="mb-1">Gaston Lapierre</p>
                                                  <a href="#!" class="link-primary fw-medium">hello@dundermuffilin.com</a>
                                             </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-3">
                                             <h5 class="">Contact Number</h5>
                                             <div>
                                                  <a href="#!"><i class='bx bx-edit-alt fs-18'></i></a>
                                             </div>
                                        </div>
                                        <p class="mb-1">(723) 732-760-5760</p>

                                        <div class="d-flex justify-content-between mt-3">
                                             <h5 class="">Shipping Address</h5>
                                             <div>
                                                  <a href="#!"><i class='bx bx-edit-alt fs-18'></i></a>
                                             </div>
                                        </div>

                                        <div>
                                             <p class="mb-1">Wilson's Jewelers LTD</p>
                                             <p class="mb-1">1344 Hershell Hollow Road ,</p>
                                             <p class="mb-1">Tukwila, WA 98168 ,</p>
                                             <p class="mb-1">United States</p>
                                             <p class="">(723) 732-760-5760</p>
                                        </div>

                                        <div class="d-flex justify-content-between mt-3">
                                             <h5 class="">Billing Address</h5>
                                             <div>
                                                  <a href="#!"><i class='bx bx-edit-alt fs-18'></i></a>
                                             </div>
                                        </div>

                                        <p class="mb-1">Same as shipping address</p>
                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-body">
                                        <div class="mapouter">
                                             <div class="gmap_canvas"><iframe class="gmap_iframe rounded" width="100%" style="height: 418px;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=1980&amp;height=400&amp;hl=en&amp;q=University of Oxford&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>

          </div>
          <!-- End Container Fluid -->

          <!-- ========== Footer Start ========== -->
          <jsp:include page="/webPage/admin/footer.jsp"></jsp:include>
          <!-- ========== Footer End ========== -->

     </div>
     <!-- ==================================================== -->
     <!-- End Page Content -->
     <!-- ==================================================== -->

     </div>
     <!-- END Wrapper -->

     <!-- Vendor Javascript (Require in all Page) -->
     <script src="../webPage/admin/assets/js/vendor.js"></script>

     <!-- App Javascript (Require in all Page) -->
     <script src="../webPage/admin/assets/js/app.js"></script>

</body>

</html>