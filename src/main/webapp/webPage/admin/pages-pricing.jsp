<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

     <head>
          <!-- Title Meta -->
          <meta charset="utf-8" />
          <title>Pricing | Larkon - Responsive Admin Dashboard Template</title>
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

                    <!-- Start Container xxl -->
                    <div class="container-xxl">

                         <div class="row">
                              <div class="col-12">
                                   <div class="text-center my-4">
                                        <h3>Simple Pricing Plans</h3>
                                        <p class="text-muted text-center">
                                             Get the power and control you need to manage your organization's technical documentation
                                        </p>
                                   </div>
                                   <div class="row justify-content-center">
                                        <div class="col-lg-3">
                                             <div class="card card-pricing">
                                                  <div class="card-body">
                                                       <h5 class="mt-0 mb-3 fs-14 text-uppercase fw-semibold">Free Pack</h5>
                                                       <h2 class="mt-0 mb-3 fw-bold">$0 <span class="fs-14 fw-medium text-muted">/ Month</span></h2>

                                                       <ul class="card-pricing-features text-muted border-top pt-2 mt-2 ps-0 list-unstyled">
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>5 GB Storage</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>100 GB Bandwidth</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>1 Domain</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>No Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>24x7 Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>1 User</li>
                                                       </ul>

                                                       <div class="mt-4 text-center">
                                                            <button class="btn btn-primary px-sm-4 w-100">Get Started</button>
                                                       </div>
                                                  </div> <!-- end card body -->
                                             </div> <!-- end card -->
                                        </div> <!-- end col -->
                                        <div class="col-lg-3">
                                             <div class="card card-pricing">
                                                  <div class="card-body">
                                                       <div class="pricing-ribbon pricing-ribbon-primary float-end">Popular</div>
                                                       <h5 class="mt-0 mb-3 fs-14 text-uppercase fw-semibold">Professional Pack</h5>
                                                       <h2 class="mt-0 mb-3 fw-bold">$19 <span class="fs-14 fw-medium text-muted">/ Month</span></h2>

                                                       <ul class="card-pricing-features text-muted border-top pt-2 mt-2 ps-0 list-unstyled">
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>50 GB Storage</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>900 GB Bandwidth</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>2 Domains</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>Email Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>24x7 Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>5 Users</li>
                                                       </ul>

                                                       <div class="mt-4 text-center">
                                                            <button class="btn btn-primary px-sm-4 disabled w-100">Current Plan</button>
                                                       </div>
                                                  </div> <!-- end card body -->
                                             </div> <!-- end card -->
                                        </div> <!-- end col -->
                                        <div class="col-lg-3">
                                             <div class="card card-pricing">
                                                  <div class="card-body">
                                                       <h5 class="mt-0 mb-3 fs-14 text-uppercase fw-semibold">Business Pack</h5>
                                                       <h2 class="mt-0 mb-3 fw-bold">$29 <span class="fs-14 fw-medium text-muted">/ Month</span></h2>

                                                       <ul class="card-pricing-features text-muted border-top pt-2 mt-2 ps-0 list-unstyled">
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>500 GB Storage</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>2.5 TB Bandwidth</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>5 Domains</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>Email Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>24x7 Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>10 Users</li>
                                                       </ul>

                                                       <div class="mt-4 text-center">
                                                            <button class="btn btn-primary px-sm-4 w-100">Get Started</button>
                                                       </div>
                                                  </div> <!-- end card body -->
                                             </div> <!-- end card -->
                                        </div> <!-- end col -->
                                        <div class="col-lg-3">
                                             <div class="card card-pricing">
                                                  <div class="card-body">
                                                       <h5 class="mt-0 mb-3 fs-14 text-uppercase fw-semibold">Enterprise Pack</h5>
                                                       <h2 class="mt-0 mb-3 fw-bold">$49 <span class="fs-14 fw-medium text-muted">/ Month</span></h2>

                                                       <ul class="card-pricing-features text-muted border-top pt-2 mt-2 ps-0 list-unstyled">
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>2 TB Storage</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>Unlimited Bandwidth</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>50 Domains</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>Email Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>24x7 Support</li>
                                                            <li class="text-dark"><i class='bx bx-check-circle text-primary fs-15 me-1'></i>Unlimited Users</li>
                                                       </ul>

                                                       <div class="mt-4 text-center">
                                                            <button class="btn btn-primary px-sm-4 w-100">Get Started</button>
                                                       </div>
                                                  </div> <!-- end card body -->
                                             </div> <!-- end card -->
                                        </div> <!-- end col -->
                                   </div> <!-- end row -->
                              </div> <!-- end col -->
                         </div> <!-- end row -->

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