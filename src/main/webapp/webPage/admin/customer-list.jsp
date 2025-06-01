<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0050)customer-list -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Customer List | Larkon - Responsive Admin Dashboard Template</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="A fully responsive premium admin dashboard template">
     <meta name="author" content="Techzaa">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">

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
     
     <style type="text/css" data-href="lib\style.css">
          .star-rating {
               width: 0;
               position: relative;
               display: inline-block;
               background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDguOSIgaGVpZ2h0PSIxMDMuNiIgdmlld0JveD0iMCAwIDEwOC45IDEwMy42Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2UzZTZlNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnN0YXJfMDwvdGl0bGU+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTA4LjkgMzkuNiA3MS4zIDM0LjEgNTQuNCAwIDM3LjYgMzQuMSAwIDM5LjYgMjcuMiA2Ni4xIDIwLjggMTAzLjYgNTQuNCA4NS45IDg4LjEgMTAzLjYgODEuNyA2Ni4xIDEwOC45IDM5LjYiLz48L2c+PC9nPjwvc3ZnPg0K);
               background-position: 0 0;
               background-repeat: repeat-x;
               cursor: pointer;
          }

          .star-rating .star-value {
               position: absolute;
               height: 100%;
               width: 100%;
               background: url('data:image/svg+xml;base64,PHN2Zw0KCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwOC45IiBoZWlnaHQ9IjEwMy42IiB2aWV3Qm94PSIwIDAgMTA4LjkgMTAzLjYiPg0KCTxkZWZzPg0KCQk8c3R5bGU+LmNscy0xe2ZpbGw6I2YxYzk0Nzt9PC9zdHlsZT4NCgk8L2RlZnM+DQoJPHRpdGxlPnN0YXIxPC90aXRsZT4NCgk8ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj4NCgkJPGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj4NCgkJCTxwb2x5Z29uIGNsYXNzPSJjbHMtMSIgcG9pbnRzPSI1NC40IDAgNzEuMyAzNC4xIDEwOC45IDM5LjYgODEuNyA2Ni4xIDg4LjEgMTAzLjYgNTQuNCA4NS45IDIwLjggMTAzLjYgMjcuMiA2Ni4xIDAgMzkuNiAzNy42IDM0LjEgNTQuNCAwIi8+DQoJCTwvZz4NCgk8L2c+DQo8L3N2Zz4NCg==');
               background-repeat: repeat-x;
          }

          .star-rating.disabled {
               cursor: default;
          }

          .star-rating.is-busy {
               cursor: wait;
          }

          .star-rating .star-value.rtl {
               -moz-transform: scaleX(-1);
               -o-transform: scaleX(-1);
               -webkit-transform: scaleX(-1);
               transform: scaleX(-1);
               filter: FlipH;
               -ms-filter: "FlipH";
               right: 0;
               left: auto;
          }
     </style>
</head>

<body>

     <!-- START Wrapper -->
     <div class="wrapper">

          <!-- ========== Topbar Start ========== -->
			<jsp:include page="/webPage/admin/header.jsp"></jsp:include>
          <!-- Activity Timeline -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-activity-offcanvas"
                    style="max-width: 450px; width: 100%;">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas"
                              aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar="init" class="h-100 p-4">
                              <div class="simplebar-wrapper" style="margin: -36px;">
                                   <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                   </div>
                                   <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                             <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                                  aria-label="scrollable content"
                                                  style="height: 100%; overflow: hidden scroll;">
                                                  <div class="simplebar-content" style="padding: 36px;">
                                                       <div class="position-relative ms-2">
                                                            <span
                                                                 class="position-absolute start-0  top-0 border border-dashed h-100"></span>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:folder-check-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-1 text-dark fw-semibold fs-15 lh-base">
                                                                                Report-Fix / Update </h5>
                                                                           <p class="d-flex align-items-center">Add 3
                                                                                files to <span
                                                                                     class=" d-flex align-items-center text-primary ms-1"><iconify-icon
                                                                                          icon="iconamoon:file-light"><template
                                                                                               shadowrootmode="open">
                                                                                               <style
                                                                                                    data-style="data-style">
                                                                                                    :host {
                                                                                                         display: inline-block;
                                                                                                         vertical-align: 0
                                                                                                    }

                                                                                                    span,
                                                                                                    svg {
                                                                                                         display: block
                                                                                                    }
                                                                                               </style>
                                                                                          </template></iconify-icon>
                                                                                     Tasks</span></p>
                                                                           <div
                                                                                class="bg-light bg-opacity-50 rounded-2 p-2">
                                                                                <div class="row">
                                                                                     <div
                                                                                          class="col-lg-6 border-end border-light">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-figma fs-20 text-red"></i>
                                                                                               <a href="customer-list#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="customer-list#!"
                                                                                                    class="text-dark fw-medium">larkon.docs</a>
                                                                                          </div>
                                                                                     </div>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-2 text-muted">Monday , 4:24 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:check-circle-1-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-1 text-dark fw-semibold fs-15 lh-base">
                                                                                Project Status
                                                                           </h5>
                                                                           <p class="d-flex align-items-center mb-0">
                                                                                Marked<span
                                                                                     class=" d-flex align-items-center text-primary mx-1"><iconify-icon
                                                                                          icon="iconamoon:file-light"><template
                                                                                               shadowrootmode="open">
                                                                                               <style
                                                                                                    data-style="data-style">
                                                                                                    :host {
                                                                                                         display: inline-block;
                                                                                                         vertical-align: 0
                                                                                                    }

                                                                                                    span,
                                                                                                    svg {
                                                                                                         display: block
                                                                                                    }
                                                                                               </style>
                                                                                          </template></iconify-icon>
                                                                                     Design </span> as <span
                                                                                     class="badge bg-success-subtle text-success px-2 py-1 ms-1">
                                                                                     Completed</span></p>
                                                                           <div
                                                                                class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
                                                                                <a href="customer-list#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="customer-list#!"
                                                                                          class="fw-medium text-primary fs-18"
                                                                                          data-bs-toggle="tooltip"
                                                                                          data-bs-title="Download"
                                                                                          data-bs-placement="bottom"><iconify-icon
                                                                                               icon="iconamoon:cloud-download-duotone"><template
                                                                                                    shadowrootmode="open">
                                                                                                    <style
                                                                                                         data-style="data-style">
                                                                                                         :host {
                                                                                                              display: inline-block;
                                                                                                              vertical-align: 0
                                                                                                         }

                                                                                                         span,
                                                                                                         svg {
                                                                                                              display: block
                                                                                                         }
                                                                                                    </style>
                                                                                               </template></iconify-icon></a>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday , 3:00 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16">UI</span>
                                                                      <div class="ms-2">
                                                                           <h5 class="mb-1 text-dark fw-semibold fs-15">
                                                                                Larkon Application UI v2.0.0 <span
                                                                                     class="badge bg-primary-subtle text-primary px-2 py-1 ms-1">
                                                                                     Latest</span>
                                                                           </h5>
                                                                           <p>Get access to over 20+ pages including a
                                                                                dashboard layout, charts, kanban board,
                                                                                calendar, and pre-order E-commerce &amp;
                                                                                Marketing pages.</p>
                                                                           <div class="mt-2">
                                                                                <a href="customer-list#!"
                                                                                     class="btn btn-light btn-sm">Download
                                                                                     Zip</a>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday , 2:10 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
                                                                                src="../webPage/admin/assets/images/users/avatar-7.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Alex
                                                                                Smith Attached Photos
                                                                           </h5>
                                                                           <div class="row g-2 mt-2">
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-6.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-3.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-4.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday 1:00 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
                                                                                src="../webPage/admin/assets/images/users/avatar-6.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Rebecca
                                                                                J. added a new team member
                                                                           </h5>
                                                                           <p class="d-flex align-items-center gap-1">
                                                                                <iconify-icon
                                                                                     icon="iconamoon:check-circle-1-duotone"
                                                                                     class="text-success"><template
                                                                                          shadowrootmode="open">
                                                                                          <style
                                                                                               data-style="data-style">
                                                                                               :host {
                                                                                                    display: inline-block;
                                                                                                    vertical-align: 0
                                                                                               }

                                                                                               span,
                                                                                               svg {
                                                                                                    display: block
                                                                                               }
                                                                                          </style>
                                                                                     </template></iconify-icon> Added a
                                                                                new member to
                                                                                Front Dashboard</p>
                                                                           <h6 class="mt-3 text-muted">Monday 10:00 AM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:certificate-badge-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Achievements
                                                                           </h5>
                                                                           <p
                                                                                class="d-flex align-items-center gap-1 mt-1">
                                                                                Earned a <iconify-icon
                                                                                     icon="iconamoon:certificate-badge-duotone"
                                                                                     class="text-danger fs-20"><template
                                                                                          shadowrootmode="open">
                                                                                          <style
                                                                                               data-style="data-style">
                                                                                               :host {
                                                                                                    display: inline-block;
                                                                                                    vertical-align: 0
                                                                                               }

                                                                                               span,
                                                                                               svg {
                                                                                                    display: block
                                                                                               }
                                                                                          </style>
                                                                                     </template></iconify-icon>" Best
                                                                                Product Award"</p>
                                                                           <h6 class="mt-3 text-muted">Monday 9:30 AM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <a href="customer-list#!"
                                                            class="btn btn-outline-dark w-100">View All</a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="simplebar-placeholder" style="width: auto; height: 1101px;"></div>
                              </div>
                              <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                   <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                              </div>
                              <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                                   <div class="simplebar-scrollbar"
                                        style="height: 361px; transform: translate3d(0px, 0px, 0px); display: block;">
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>

          <!-- Right Sidebar (Theme Settings) -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-settings-offcanvas">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0">Theme Settings</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas"
                              aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar="init" class="h-100">
                              <div class="simplebar-wrapper" style="margin: 0px;">
                                   <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                   </div>
                                   <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                             <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                                  aria-label="scrollable content"
                                                  style="height: 100%; overflow: hidden scroll;">
                                                  <div class="simplebar-content" style="padding: 0px;">
                                                       <div class="p-3 settings-bar">

                                                            <div>
                                                                 <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-bs-theme" id="layout-color-light"
                                                                           value="light">
                                                                      <label class="form-check-label"
                                                                           for="layout-color-light">Light</label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-bs-theme" id="layout-color-dark"
                                                                           value="dark">
                                                                      <label class="form-check-label"
                                                                           for="layout-color-dark">Dark</label>
                                                                 </div>
                                                            </div>

                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-topbar-color"
                                                                           id="topbar-color-light" value="light">
                                                                      <label class="form-check-label"
                                                                           for="topbar-color-light">Light</label>
                                                                 </div>
                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-topbar-color"
                                                                           id="topbar-color-dark" value="dark">
                                                                      <label class="form-check-label"
                                                                           for="topbar-color-dark">Dark</label>
                                                                 </div>
                                                            </div>


                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-color"
                                                                           id="leftbar-color-light" value="light">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-color-light">
                                                                           Light
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-color"
                                                                           id="leftbar-color-dark" value="dark">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-color-dark">
                                                                           Dark
                                                                      </label>
                                                                 </div>
                                                            </div>

                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-default" value="default">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-default">
                                                                           Default
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size" id="leftbar-size-small"
                                                                           value="condensed">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small">
                                                                           Condensed
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size" id="leftbar-hidden"
                                                                           value="hidden">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-hidden">
                                                                           Hidden
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-small-hover-active"
                                                                           value="sm-hover-active">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small-hover-active">
                                                                           Small Hover Active
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-small-hover"
                                                                           value="sm-hover">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small-hover">
                                                                           Small Hover
                                                                      </label>
                                                                 </div>
                                                            </div>

                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="simplebar-placeholder" style="width: auto; height: 609px;"></div>
                              </div>
                              <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                   <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                              </div>
                              <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                                   <div class="simplebar-scrollbar"
                                        style="height: 484px; transform: translate3d(0px, 0px, 0px); display: block;">
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

                    <div class="row">
                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:users-group-two-rounded-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M15.5 7.5a3.5 3.5 0 1 1-7 0a3.5 3.5 0 0 1 7 0">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="M19.5 7.5a2.5 2.5 0 1 1-5 0a2.5 2.5 0 0 1 5 0m-15 0a2.5 2.5 0 1 0 5 0a2.5 2.5 0 0 0-5 0"
                                                                      opacity=".4"></path>
                                                                 <path fill="currentColor"
                                                                      d="M18 16.5c0 1.933-2.686 3.5-6 3.5s-6-1.567-6-3.5S8.686 13 12 13s6 1.567 6 3.5">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="M22 16.5c0 1.38-1.79 2.5-4 2.5s-4-1.12-4-2.5s1.79-2.5 4-2.5s4 1.12 4 2.5m-20 0C2 17.88 3.79 19 6 19s4-1.12 4-2.5S8.21 14 6 14s-4 1.12-4 2.5"
                                                                      opacity=".4"></path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">All Customers</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+22.63k</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>34.4%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:box-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M8.422 20.618C10.178 21.54 11.056 22 12 22V12L2.638 7.073l-.04.067C2 8.154 2 9.417 2 11.942v.117c0 2.524 0 3.787.597 4.801c.598 1.015 1.674 1.58 3.825 2.709z">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="m17.577 4.432l-2-1.05C13.822 2.461 12.944 2 12 2c-.945 0-1.822.46-3.578 1.382l-2 1.05C4.318 5.536 3.242 6.1 2.638 7.072L12 12l9.362-4.927c-.606-.973-1.68-1.537-3.785-2.641"
                                                                      opacity=".7"></path>
                                                                 <path fill="currentColor"
                                                                      d="m21.403 7.14l-.041-.067L12 12v10c.944 0 1.822-.46 3.578-1.382l2-1.05c2.151-1.129 3.227-1.693 3.825-2.708c.597-1.014.597-2.277.597-4.8v-.117c0-2.525 0-3.788-.597-4.802"
                                                                      opacity=".5"></path>
                                                                 <path fill="currentColor"
                                                                      d="m6.323 4.484l.1-.052l1.493-.784l9.1 5.005l4.025-2.011q.205.232.362.498c.15.254.262.524.346.825L17.75 9.964V13a.75.75 0 0 1-1.5 0v-2.286l-3.5 1.75v9.44A3 3 0 0 1 12 22c-.248 0-.493-.032-.75-.096v-9.44l-8.998-4.5c.084-.3.196-.57.346-.824q.156-.266.362-.498l9.04 4.52l3.387-1.693z">
                                                                 </path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Orders</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+4.5k</p>
                                             <div>
                                                  <span class="badge text-danger bg-danger-subtle fs-12"><i
                                                            class="bx bx-down-arrow-alt"></i>8.1%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:headphones-round-sound-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M2 12.124C2 6.533 6.477 2 12 2s10 4.533 10 10.124v5.243c0 .817 0 1.378-.143 1.87a3.52 3.52 0 0 1-1.847 2.188c-.458.22-1.004.307-1.801.434l-.13.02a13 13 0 0 1-.727.105c-.209.02-.422.027-.64-.016a2.1 2.1 0 0 1-1.561-1.35a2.2 2.2 0 0 1-.116-.639c-.012-.204-.012-.452-.012-.742v-4.173c0-.425 0-.791.097-1.105a2.1 2.1 0 0 1 1.528-1.43c.316-.073.677-.044 1.096-.01l.093.007l.11.01c.783.062 1.32.104 1.775.275q.481.181.883.487v-1.174c0-4.811-3.853-8.711-8.605-8.711s-8.605 3.9-8.605 8.711v1.174c.267-.203.563-.368.883-.487c.455-.17.992-.213 1.775-.276l.11-.009l.093-.007c.42-.034.78-.063 1.096.01a2.1 2.1 0 0 1 1.528 1.43c.098.314.097.68.097 1.105v4.172c0 .291 0 .54-.012.743c-.012.213-.04.427-.116.638a2.1 2.1 0 0 1-1.56 1.35a2.2 2.2 0 0 1-.641.017c-.201-.02-.444-.059-.727-.104l-.13-.02c-.797-.128-1.344-.215-1.801-.436a3.52 3.52 0 0 1-1.847-2.188c-.118-.405-.139-.857-.142-1.461L2 17.58z">
                                                                 </path>
                                                                 <path fill="currentColor" fill-rule="evenodd"
                                                                      d="M12 5.75a.75.75 0 0 1 .75.75v5a.75.75 0 0 1-1.5 0v-5a.75.75 0 0 1 .75-.75m3 1.5a.75.75 0 0 1 .75.75v2a.75.75 0 0 1-1.5 0V8a.75.75 0 0 1 .75-.75m-6 0a.75.75 0 0 1 .75.75v2a.75.75 0 0 1-1.5 0V8A.75.75 0 0 1 9 7.25"
                                                                      clip-rule="evenodd" opacity=".5"></path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Services Request</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+1.03k</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>12.6%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:bill-list-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M7.245 2h9.51c1.159 0 1.738 0 2.206.163a3.05 3.05 0 0 1 1.881 1.936C21 4.581 21 5.177 21 6.37v14.004c0 .858-.985 1.314-1.608.744a.946.946 0 0 0-1.284 0l-.483.442a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0l-.483-.442a.946.946 0 0 0-1.284 0c-.623.57-1.608.114-1.608-.744V6.37c0-1.193 0-1.79.158-2.27c.3-.913.995-1.629 1.881-1.937C5.507 2 6.086 2 7.245 2"
                                                                      opacity=".5"></path>
                                                                 <path fill="currentColor"
                                                                      d="M7 6.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 10.25a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 13.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5z">
                                                                 </path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Invoice &amp; Payment</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">$38,908.00</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>45.9%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                    </div>

                    <div class="row">
                         <div class="col-xl-12">
                              <div class="card">
                                   <div class="d-flex card-header justify-content-between align-items-center">
                                        <div>
                                             <h4 class="card-title">All Customers List</h4>
                                        </div>
                                        <div class="dropdown">
                                             <a href="customer-list#"
                                                  class="dropdown-toggle btn btn-sm btn-outline-light rounded"
                                                  data-bs-toggle="dropdown" aria-expanded="false">
                                                  This Month
                                             </a>
                                             <div class="dropdown-menu dropdown-menu-end">
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Download</a>
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Export</a>
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Import</a>
                                             </div>
                                        </div>
                                   </div>
                                   <div>
                                        <div class="table-responsive">
                                             <table class="table align-middle mb-0 table-hover table-centered">
                                                  <thead class="bg-light-subtle">
                                                       <tr>
                                                            <th style="width: 20px;">
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck1">
                                                                      <label class="form-check-label"
                                                                           for="customCheck1"></label>
                                                                 </div>
                                                            </th>
                                                            <th>Customer Name</th>
                                                            <th>Invoice ID</th>
                                                            <th>Status</th>
                                                            <th>Total Amount</th>
                                                            <th>Amount Due</th>
                                                            <th>Due Date</th>
                                                            <th>Payment Method</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck2">
                                                                      <label class="form-check-label"
                                                                           for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-2.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Michael A. Miner</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2540</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td> $4,521 </td>
                                                            <td> $8,901 </td>
                                                            <td> 07 Jan, 2023</td>
                                                            <td> Mastercard </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck3">
                                                                      <label class="form-check-label"
                                                                           for="customCheck3">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-3.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Theresa T. Brose</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV3924</a> </td>
                                                            <td> <span
                                                                      class="badge bg-danger-subtle text-danger px-2 py-1">Cancel</span>
                                                            </td>
                                                            <td> $7,836 </td>
                                                            <td> $9,902 </td>
                                                            <td> 03 Dec, 2023</td>
                                                            <td> Visa </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck4">
                                                                      <label class="form-check-label"
                                                                           for="customCheck4">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-4.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 James L. Erickson</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV5032</a> </td>
                                                            <td>
                                                                 <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td> $1,347 </td>
                                                            <td> $6,718 </td>
                                                            <td> 28 Sep, 2023 </td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck5">
                                                                      <label class="form-check-label"
                                                                           for="customCheck5">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-5.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Lily W. Wilson</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV1695</a> </td>
                                                            <td><span
                                                                      class="badge bg-primary-subtle text-primary py-1 px-2">Pending</span>
                                                            </td>
                                                            <td> $9,457 </td>
                                                            <td> $3,928 </td>
                                                            <td>10 Aug, 2023</td>
                                                            <td> Mastercard</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck6">
                                                                      <label class="form-check-label"
                                                                           for="customCheck6">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-6.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Sarah M. Brooks</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV8473</a> </td>
                                                            <td> <span
                                                                      class="badge bg-danger-subtle text-danger px-2 py-1 ">Cancel</span>
                                                            </td>
                                                            <td> $4,214</td>
                                                            <td> $9,814 </td>
                                                            <td> 22 May, 2023 </td>
                                                            <td> Visa</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-7.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Joe K. Hall</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2150</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$2,513</td>
                                                            <td> $5,891 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-8.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Ralph Hueber</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV5636</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$3,103</td>
                                                            <td> $8,415 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Visa </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-9.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Sarah Drescher</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2940</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$2,416</td>
                                                            <td> $7,715 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Mastercard </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-10.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Leonie Meister</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV9027</a> </td>
                                                            <td><span
                                                                      class="badge bg-primary-subtle text-primary py-1 px-2">Pending</span>
                                                            </td>
                                                            <td>$1,367</td>
                                                            <td> $3,651 </td>
                                                            <td>15 Mar, 2023 </td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                  </tbody>
                                             </table>
                                        </div>
                                        <!-- end table-responsive -->
                                   </div>
                                   <div class="card-footer border-top">
                                        <nav aria-label="Page navigation example">
                                             <ul class="pagination justify-content-end mb-0">
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">Previous</a></li>
                                                  <li class="page-item active"><a class="page-link"
                                                            href="javascript:void(0);">1</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">2</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">3</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">Next</a></li>
                                             </ul>
                                        </nav>
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



     <svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
          xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
          style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
          <defs id="SvgjsDefs1002"></defs>
          <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
          <path id="SvgjsPath1004" d="M0 0 "></path>
     </svg>
</body>

</html>