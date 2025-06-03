<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <!-- Title Meta -->
     <meta charset="utf-8" />
     <title>FAQs | Larkon - Responsive Admin Dashboard Template</title>
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

               <!-- Start Container Fluid -->
               <div class="container-xxl">

                    <div class="row justify-content-center">
                         <div class="col-lg-12">
                              <div class="card overflow-hidden" style="background: url('../webPage/admin/assets/images/small/img-2.jpg'); ">
                                   <div class="position-absolute top-0 end-0 bottom-0 start-0 bg-dark opacity-75"></div>
                                   <div class="card-body">
                                        <div class="row justify-content-center">
                                             <div class="col-lg-7 text-center">
                                                  <h3 class="text-white">Frequently Asked Questions</h3>
                                                  <p class="text-white-50">We're here to help with any questions you have about plans, pricing, and supported features.</p>

                                                  <div class="search-bar">
                                                       <span><i class="bx bx-search-alt"></i></span>
                                                       <input type="search" class="form-control rounded-pill bg- border-0" id="search" placeholder="Search ...">
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>

                    <div class="row mt-4">
                         <div class="col">
                              <div class="card">
                                   <div class="card-body p-4">
                                        <div class="row g-xl-4">
                                             <div class="col-xl-6">
                                                  
                                                  <h4 class="mb-3 fw-semibold fs-16">General</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true" aria-controls="faq1">
                                                                      Can I use Dummy FAQs for my website or project?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq1" class="accordion-collapse collapse show" aria-labelledby="faq1">
                                                                 <div class="accordion-body">
                                                                      Yes, you can use Dummy FAQs to populate your website or project during development or testing phases. They help simulate the appearance and functionality of a real FAQ section without requiring actual content.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2" aria-expanded="false" aria-controls="faq2">
                                                                      Are Dummy FAQs suitable for customer support purposes?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq2" class="accordion-collapse collapse" aria-labelledby="faq2">
                                                                 <div class="accordion-body">
                                                                      While Dummy FAQs can be used internally for training customer support teams, they are not suitable for public-facing customer support. Real FAQs should be based on genuine customer inquiries to provide accurate and helpful information.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3" aria-expanded="false" aria-controls="faq3">
                                                                      Do Dummy FAQs require attribution?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq3" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      No, Dummy FAQs do not require attribution since they are not based on real questions or contributed by individuals. You can use them freely for internal testing or demonstration purposes.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                                  <h4 class="mb-3 mt-4 fw-semibold fs-16">Refunds</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq4" aria-expanded="true" aria-controls="faq4">
                                                                      How do I request a refund?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq4" class="accordion-collapse collapse show" aria-labelledby="faq4">
                                                                 <div class="accordion-body">
                                                                      To request a refund, simply contact our customer support team through email or phone and provide details about your purchase and reason for the refund. Our representatives will guide you through the process.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5" aria-expanded="false" aria-controls="faq5">
                                                                      What is the refund policy?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq5" class="accordion-collapse collapse" aria-labelledby="faq5">
                                                                 <div class="accordion-body">
                                                                      Our refund policy allows customers to request a refund within 30 days of purchase for eligible products or services. Certain restrictions may apply, so it's essential to review the terms and conditions specific to your purchase.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq6" aria-expanded="false" aria-controls="faq6">
                                                                      How long does it take to process a refund?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq6" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      Refunds are typically processed within 3-5 business days after the request is approved. However, it may take longer depending on the payment method and financial institution involved.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                             </div>

                                             <div class="col-xl-6">
                                                  
                                                  <h4 class="mb-3 fw-semibold fs-16">Payments</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq7" aria-expanded="true" aria-controls="faq7">
                                                                      Can I test my website/app with Dummy Payments?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq7" class="accordion-collapse collapse show" aria-labelledby="faq7">
                                                                 <div class="accordion-body">
                                                                      Yes, Dummy Payments are commonly used by developers and businesses to test the functionality of e-commerce platforms, mobile apps, and payment gateways. They help identify and resolve issues without risking real transactions.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq8" aria-expanded="false" aria-controls="faq8">
                                                                      Are Dummy Payments secure?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq8" class="accordion-collapse collapse" aria-labelledby="faq8">
                                                                 <div class="accordion-body">
                                                                      Dummy Payments used in controlled environments for training or demonstration purposes are generally secure. However, it's crucial not to confuse them with real transactions and avoid entering genuine financial information.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq9" aria-expanded="false" aria-controls="faq9">
                                                                      How can I differentiate between a Dummy Payment and a real one?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq9" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      Real payments involve the transfer of actual funds, resulting in a change in financial balances. Dummy Payments, on the other hand, do not involve any monetary exchange and are typically labeled or indicated as test transactions. Always verify the authenticity of transactions before proceeding with any action.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                                  <h4 class="mb-3 mt-4 fw-semibold fs-16">Support</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq10" aria-expanded="true" aria-controls="faq10">
                                                                      How do I contact customer support?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq10" class="accordion-collapse collapse show" aria-labelledby="faq10">
                                                                 <div class="accordion-body">
                                                                      You can contact our customer support team via email, phone, or live chat. Our representatives are available to assist you during business hours, Monday through Friday.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq11" aria-expanded="false" aria-controls="faq11">
                                                                      Is customer support available 24/7?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq11" class="accordion-collapse collapse" aria-labelledby="faq11">
                                                                 <div class="accordion-body">
                                                                      Our customer support is available during regular business hours, Monday through Friday. However, you can leave us a message outside of these hours, and we'll respond to you as soon as possible.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq12" aria-expanded="false" aria-controls="faq12">
                                                                      How long does it take to receive a response from customer support?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq12" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      We strive to respond to all customer inquiries within 24 hours during regular business hours. Response times may vary depending on the volume of inquiries received.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                             </div>
                                        </div> <!-- end row-->

                                        <div class="row my-5">
                                             <div class="col-12 text-center">
                                                  <h4>Can't find a questions?</h4>
                                                  <button type="button" class="btn btn-success mt-2"><i class="bx bx-envelope me-1"></i> Email us your question</button>
                                                  <button type="button" class="btn btn-info mt-2 ms-1"><i class="bx bxl-twitter me-1"></i> Send us a tweet</button>
                                             </div>
                                        </div>

                                   </div> <!-- end card-body-->
                              </div> <!-- end card-->
                         </div> <!-- end col-->
                    </div>

               </div>
               <!-- End Container xxl -->

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