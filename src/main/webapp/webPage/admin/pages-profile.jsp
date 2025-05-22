<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0050)pages-profile -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Profile | Larkon - Responsive Admin Dashboard Template</title>
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
                                                                                               <a href="pages-profile#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="pages-profile#!"
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
                                                                                <a href="pages-profile#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="pages-profile#!"
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
                                                                                <a href="pages-profile#!"
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
                                                                                src="../webPage/admin/assets/images/users/avatar-7.jpg" alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Alex Smith Attached Photos
                                                                           </h5>
                                                                           <div class="row g-2 mt-2">
                                                                                <div class="col-lg-4">
                                                                                     <a href="pages-profile#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-6.jpg" alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="pages-profile#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-3.jpg" alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="pages-profile#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-4.jpg" alt=""
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
                                                                                src="../webPage/admin/assets/images/users/avatar-6.jpg" alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Rebecca J. added a new team member
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
                                                                                new member to Front Dashboard
                                                                           </p>
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
                                                       <a href="pages-profile#!"
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
                                        style="height: 484px; display: block; transform: translate3d(0px, 0px, 0px);">
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
                         <div class="col-xl-9 col-lg-8">
                              <div class="card overflow-hidden">
                                   <div class="card-body">
                                        <div class="bg-primary profile-bg rounded-top position-relative mx-n3 mt-n3">
                                             <img src="../webPage/admin/assets/images/users/avatar-1.jpg" alt=""
                                                  class="avatar-xl border border-light border-3 rounded-circle position-absolute top-100 start-0 translate-middle ms-5">
                                        </div>
                                        <div class="mt-5 d-flex flex-wrap align-items-center justify-content-between">
                                             <div>
                                                  <h4 class="mb-1">Gaston Lapierre <i
                                                            class="bx bxs-badge-check text-success align-middle"></i>
                                                  </h4>
                                                  <p class="mb-0">Project Head Manager</p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 my-2 my-lg-0">
                                                  <a href="pages-profile#!" class="btn btn-info"><i
                                                            class="bx bx-message-dots"></i>
                                                       Message</a>
                                                  <a href="pages-profile#!" class="btn btn-outline-primary"><i
                                                            class="bx bx-plus"></i>
                                                       Follow</a>
                                                  <div class="dropdown">
                                                       <a href="pages-profile#"
                                                            class="dropdown-toggle arrow-none card-drop"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            <iconify-icon icon="solar:menu-dots-bold"
                                                                 class="fs-20 align-middle text-muted"><template
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <path fill="currentColor"
                                                                                d="M7 12a2 2 0 1 1-4 0a2 2 0 0 1 4 0m7 0a2 2 0 1 1-4 0a2 2 0 0 1 4 0m7 0a2 2 0 1 1-4 0a2 2 0 0 1 4 0">
                                                                           </path>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </a>
                                                       <div class="dropdown-menu dropdown-menu-end">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);"
                                                                 class="dropdown-item">Download</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);"
                                                                 class="dropdown-item">Export</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);"
                                                                 class="dropdown-item">Import</a>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="row mt-3 gy-2">
                                             <div class="col-lg-2 col-6">
                                                  <div class="d-flex align-items-center gap-2 border-end">
                                                       <div class="">
                                                            <iconify-icon icon="solar:clock-circle-bold-duotone"
                                                                 class="fs-28 text-primary"><template
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <path fill="currentColor"
                                                                                d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10"
                                                                                opacity=".5"></path>
                                                                           <path fill="currentColor" fill-rule="evenodd"
                                                                                d="M12 7.25a.75.75 0 0 1 .75.75v3.69l2.28 2.28a.75.75 0 1 1-1.06 1.06l-2.5-2.5a.75.75 0 0 1-.22-.53V8a.75.75 0 0 1 .75-.75"
                                                                                clip-rule="evenodd"></path>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                       <div>
                                                            <h5 class="mb-1">3+ Years Job</h5>
                                                            <p class="mb-0">Experience</p>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div class="col-lg-2 col-6">
                                                  <div class="d-flex align-items-center gap-2 border-end">
                                                       <div class="">
                                                            <iconify-icon icon="solar:cup-star-bold-duotone"
                                                                 class="fs-28 text-primary"><template
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <path fill="currentColor"
                                                                                d="M12 16c-5.76 0-6.78-5.74-6.96-10.294c-.05-1.266-.076-1.9.4-2.485c.476-.586 1.045-.682 2.184-.874A26.4 26.4 0 0 1 12 2c1.783 0 3.253.157 4.377.347c1.138.192 1.708.288 2.183.874c.476.586.451 1.219.4 2.485C18.78 10.259 17.76 16 12 16"
                                                                                opacity=".5"></path>
                                                                           <path fill="currentColor"
                                                                                d="m17.64 12.422l2.817-1.565c.752-.418 1.128-.627 1.336-.979C22 9.526 22 9.096 22 8.235v-.073c0-1.043 0-1.565-.283-1.958s-.778-.558-1.768-.888L19 5l-.017.085q-.008.283-.022.621c-.088 2.225-.377 4.733-1.32 6.716M5.04 5.706c.087 2.225.376 4.733 1.32 6.716l-2.817-1.565c-.752-.418-1.129-.627-1.336-.979S2 9.096 2 8.235v-.073c0-1.043 0-1.565.283-1.958s.778-.558 1.768-.888L5 5l.017.087q.008.281.022.62">
                                                                           </path>
                                                                           <path fill="currentColor" fill-rule="evenodd"
                                                                                d="M5.25 22a.75.75 0 0 1 .75-.75h12a.75.75 0 0 1 0 1.5H6a.75.75 0 0 1-.75-.75"
                                                                                clip-rule="evenodd"></path>
                                                                           <path fill="currentColor"
                                                                                d="M15.458 21.25H8.543l.297-1.75a1 1 0 0 1 .98-.804h4.36a1 1 0 0 1 .981.804z"
                                                                                opacity=".5"></path>
                                                                           <path fill="currentColor"
                                                                                d="M12 16q-.39 0-.75-.034v2.73h1.5v-2.73A8 8 0 0 1 12 16m-.854-9.977C11.526 5.34 11.716 5 12 5s.474.34.854 1.023l.098.176c.108.194.162.29.246.354c.085.064.19.088.4.135l.19.044c.738.167 1.107.25 1.195.532s-.164.577-.667 1.165l-.13.152c-.143.167-.215.25-.247.354s-.021.215 0 .438l.02.203c.076.785.114 1.178-.115 1.352c-.23.174-.576.015-1.267-.303l-.178-.082c-.197-.09-.295-.135-.399-.135s-.202.045-.399.135l-.178.082c-.691.319-1.037.477-1.267.303s-.191-.567-.115-1.352l.02-.203c.021-.223.032-.334 0-.438s-.104-.187-.247-.354l-.13-.152c-.503-.588-.755-.882-.667-1.165c.088-.282.457-.365 1.195-.532l.19-.044c.21-.047.315-.07.4-.135c.084-.064.138-.16.246-.354z">
                                                                           </path>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                       <div>
                                                            <h5 class="mb-1">5 Certificate</h5>
                                                            <p class="mb-0">Achieved</p>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div class="col-lg-2 col-6">
                                                  <div class="d-flex align-items-center gap-2">
                                                       <div class="">
                                                            <iconify-icon icon="solar:notebook-bold-duotone"
                                                                 class="fs-28 text-primary"><template
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <path fill="currentColor"
                                                                                d="M3 8c0-2.828 0-4.243.879-5.121C4.757 2 6.172 2 9 2h6c2.828 0 4.243 0 5.121.879C21 3.757 21 5.172 21 8v8c0 2.828 0 4.243-.879 5.121C19.243 22 17.828 22 15 22H9c-2.828 0-4.243 0-5.121-.879C3 20.243 3 18.828 3 16z"
                                                                                opacity=".5"></path>
                                                                           <path fill="currentColor" fill-rule="evenodd"
                                                                                d="M8.75 2.012v20h-1.5v-20zM1.25 8A.75.75 0 0 1 2 7.25h2a.75.75 0 0 1 0 1.5H2A.75.75 0 0 1 1.25 8m0 4a.75.75 0 0 1 .75-.75h2a.75.75 0 0 1 0 1.5H2a.75.75 0 0 1-.75-.75m0 4a.75.75 0 0 1 .75-.75h2a.75.75 0 0 1 0 1.5H2a.75.75 0 0 1-.75-.75"
                                                                                clip-rule="evenodd"></path>
                                                                           <path fill="currentColor"
                                                                                d="M10.75 6.5a.75.75 0 0 1 .75-.75h5a.75.75 0 0 1 0 1.5h-5a.75.75 0 0 1-.75-.75m0 3.5a.75.75 0 0 1 .75-.75h5a.75.75 0 0 1 0 1.5h-5a.75.75 0 0 1-.75-.75">
                                                                           </path>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                       <div>
                                                            <h5 class="mb-1">2 Internship</h5>
                                                            <p class="mb-0">Completed</p>
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
                                        <h4 class="card-title">Personal Information</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="">
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:backpack-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor" fill-rule="evenodd"
                                                                           d="M7.292 4.786A5.97 5.97 0 0 0 3 10.416l-.001.18v2.323q.155-.001.305.064a21.54 21.54 0 0 0 17.39 0A.75.75 0 0 1 21 12.92v-2.503a5.97 5.97 0 0 0-4.291-5.63c-.278-.091-1.12-.254-1.506-.324c-2.12-.36-4.286-.36-6.406 0c-.405.076-1.272.248-1.506.324M10 11.926a.747.747 0 0 0-.75.745c0 .411.336.745.75.745h4c.414 0 .75-.334.75-.745a.747.747 0 0 0-.75-.745z"
                                                                           clip-rule="evenodd"></path>
                                                                      <path fill="currentColor"
                                                                           d="M8.873 3.992A2.25 2.25 0 0 1 11 2.49h2c.983 0 1.82.626 2.126 1.502c.045.13.068.28.077.47c.386.07 1.227.233 1.505.324v-.061c0-.339-.011-.782-.165-1.222A3.75 3.75 0 0 0 13 1h-2a3.75 3.75 0 0 0-3.544 2.503c-.153.44-.165.883-.165 1.222v.06c.233-.075 1.1-.247 1.505-.323c.01-.19.032-.34.077-.47M21 14.477q-1.352.573-2.75.966v1.2a.75.75 0 0 1-.75.746a.75.75 0 0 1-.75-.745v-.832A23.06 23.06 0 0 1 3 14.477v1.546a4.495 4.495 0 0 0 3.539 4.381c3.597.794 7.325.794 10.923 0A4.495 4.495 0 0 0 21 16.023z"
                                                                           opacity=".5"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Project Head Manager</p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:square-academic-cap-2-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M14.217 3.5a5.17 5.17 0 0 0-4.434 0L5.489 5.512a2.25 2.25 0 0 1 .647 4.306l-1.076.461c-.534.23-.837.362-1.042.467l-.003.05L9.783 13.5a5.17 5.17 0 0 0 4.434 0l6.691-3.137c1.456-.682 1.456-3.044 0-3.726z">
                                                                      </path>
                                                                      <path fill="currentColor"
                                                                           d="M5.545 8.44a.75.75 0 0 0-.59-1.38l-1.112.477c-.557.239-1.03.441-1.4.65c-.395.222-.734.482-.989.868c-.254.386-.36.8-.408 1.25C1 10.729 1 11.243 1 11.85v2.901a.75.75 0 0 0 1.5 0v-2.862c0-.656.001-1.088.037-1.421c.034-.315.093-.47.17-.586c.075-.115.195-.231.471-.387c.292-.164.689-.335 1.292-.593z">
                                                                      </path>
                                                                      <path fill="currentColor"
                                                                           d="M5 11.258L9.783 13.5a5.17 5.17 0 0 0 4.434 0L19 11.258v5.367c0 1.008-.503 1.952-1.385 2.44C16.146 19.88 13.796 21 12 21s-4.146-1.121-5.615-1.935C5.504 18.577 5 17.633 5 16.625z"
                                                                           opacity=".5"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Went to <span
                                                            class="text-dark fw-semibold">Oxford International</span>
                                                  </p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:map-point-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M12 2c-4.418 0-8 4.003-8 8.5c0 4.462 2.553 9.312 6.537 11.174a3.45 3.45 0 0 0 2.926 0C17.447 19.812 20 14.962 20 10.5C20 6.003 16.418 2 12 2"
                                                                           opacity=".5"></path>
                                                                      <path fill="currentColor"
                                                                           d="M12 12.5a2.5 2.5 0 1 0 0-5a2.5 2.5 0 0 0 0 5">
                                                                      </path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Lives in <span
                                                            class="text-dark fw-semibold">Pittsburgh, PA 15212</span>
                                                  </p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:users-group-rounded-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <circle cx="15" cy="6" r="3" fill="currentColor"
                                                                           opacity=".4"></circle>
                                                                      <ellipse cx="16" cy="17" fill="currentColor"
                                                                           opacity=".4" rx="5" ry="3"></ellipse>
                                                                      <circle cx="9.001" cy="6" r="4"
                                                                           fill="currentColor"></circle>
                                                                      <ellipse cx="9.001" cy="17.001"
                                                                           fill="currentColor" rx="7" ry="4"></ellipse>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Followed by <span
                                                            class="text-dark fw-semibold">16.6k People</span></p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:letter-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M14.2 3H9.8C5.652 3 3.577 3 2.289 4.318S1 7.758 1 12s0 6.364 1.289 7.682S5.652 21 9.8 21h4.4c4.148 0 6.223 0 7.511-1.318S23 16.242 23 12s0-6.364-1.289-7.682S18.348 3 14.2 3"
                                                                           opacity=".5"></path>
                                                                      <path fill="currentColor"
                                                                           d="M19.128 8.033a.825.825 0 0 0-1.056-1.268l-2.375 1.98c-1.026.855-1.738 1.447-2.34 1.833c-.582.375-.977.5-1.357.5s-.774-.125-1.357-.5c-.601-.386-1.314-.978-2.34-1.834L5.928 6.765a.825.825 0 0 0-1.056 1.268l2.416 2.014c.975.812 1.765 1.47 2.463 1.92c.726.466 1.434.762 2.25.762c.814 0 1.522-.296 2.249-.763c.697-.448 1.487-1.107 2.462-1.92z">
                                                                      </path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Email <a href="pages-profile#!"
                                                            class="text-primary fw-semibold">hello@dundermuffilin.com</a>
                                                  </p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:link-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M15.728 3.884c1.434-1.44 3.532-1.47 4.694-.304c1.164 1.168 1.132 3.28-.303 4.72l-2.424 2.433a.75.75 0 0 0 1.063 1.059l2.424-2.433c1.91-1.919 2.15-4.982.303-6.838c-1.85-1.857-4.907-1.615-6.82.304L9.818 7.692c-1.912 1.919-2.152 4.982-.303 6.837a.75.75 0 1 0 1.062-1.058c-1.163-1.168-1.132-3.28.303-4.72z">
                                                                      </path>
                                                                      <path fill="currentColor"
                                                                           d="M14.485 9.47a.75.75 0 0 0-1.063 1.06c1.164 1.168 1.132 3.279-.303 4.72L8.27 20.116c-1.434 1.44-3.532 1.47-4.694.304c-1.163-1.168-1.132-3.28.303-4.72l2.424-2.433a.75.75 0 1 0-1.062-1.059l-2.424 2.433C.906 16.56.666 19.623 2.515 21.48c1.85 1.858 4.907 1.615 6.819-.304l4.848-4.867c1.91-1.918 2.15-4.982.303-6.837"
                                                                           opacity=".5"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Website <a href="pages-profile#!"
                                                            class="text-primary fw-semibold">www.larkon.co</a></p>
                                             </div>
                                             <div class="d-flex align-items-center gap-2 mb-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:global-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor" fill-rule="evenodd"
                                                                           d="M2.028 11.25A10 10 0 0 1 12 2c-.83 0-1.57.364-2.18.921c-.605.554-1.116 1.328-1.53 2.242c-.416.92-.74 1.996-.959 3.163a20 20 0 0 0-.318 2.924zm0 1.5h4.985c.036 1.002.143 1.988.318 2.924c.22 1.167.543 2.243.959 3.163c.414.914.925 1.688 1.53 2.242c.61.557 1.35.921 2.18.921c-5.27 0-9.589-4.077-9.972-9.25"
                                                                           clip-rule="evenodd"></path>
                                                                      <path fill="currentColor"
                                                                           d="M12 2c.831 0 1.57.364 2.18.921c.605.554 1.117 1.328 1.53 2.242c.417.92.74 1.996.959 3.163c.175.936.282 1.922.318 2.924h4.985A10 10 0 0 0 12 2m4.669 13.674c-.219 1.167-.542 2.243-.959 3.163c-.413.914-.925 1.688-1.53 2.242c-.61.557-1.349.921-2.18.921c5.27 0 9.589-4.077 9.972-9.25h-4.985a20 20 0 0 1-.318 2.924">
                                                                      </path>
                                                                      <path fill="currentColor"
                                                                           d="M12 3.396c-.275 0-.63.117-1.043.495c-.416.38-.833.977-1.201 1.79c-.366.808-.663 1.784-.867 2.873c-.16.859-.26 1.768-.296 2.696h6.814a18.5 18.5 0 0 0-.296-2.696c-.204-1.09-.5-2.065-.867-2.872c-.368-.814-.784-1.41-1.2-1.791c-.414-.378-.769-.495-1.044-.495m-3.111 12.05c.204 1.09.501 2.065.867 2.873c.368.813.785 1.41 1.2 1.79c.414.379.77.496 1.044.496c.275 0 .63-.117 1.044-.495c.416-.381.832-.978 1.2-1.791c.366-.808.663-1.783.867-2.873c.161-.858.261-1.768.296-2.696H8.593c.035.928.135 1.838.296 2.696"
                                                                           opacity=".5"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Language <span
                                                            class="text-dark fw-semibold">English , Spanish ,
                                                            German</span></p>
                                             </div>

                                             <div class="d-flex align-items-center gap-2">
                                                  <div
                                                       class="avatar-sm bg-light d-flex align-items-center justify-content-center rounded">
                                                       <iconify-icon icon="solar:check-circle-bold-duotone"
                                                            class="fs-20 text-secondary"><template
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
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12S6.477 2 12 2s10 4.477 10 10"
                                                                           opacity=".5"></path>
                                                                      <path fill="currentColor"
                                                                           d="M16.03 8.97a.75.75 0 0 1 0 1.06l-5 5a.75.75 0 0 1-1.06 0l-2-2a.75.75 0 1 1 1.06-1.06l1.47 1.47l2.235-2.235L14.97 8.97a.75.75 0 0 1 1.06 0">
                                                                      </path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <p class="mb-0 fs-14">Status <span
                                                            class="badge bg-success-subtle text-success ms-1">Active</span>
                                                  </p>
                                             </div>
                                             <div class="mt-2">
                                                  <a href="pages-profile#!" class="text-primary">View More</a>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
                    <div class="row">
                         <div class="col-xl-8 col-lg-7">
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">About</h4>
                                   </div>
                                   <div class="card-body">
                                        <p>I'm the model of the new Project Head Manager. I've combined a deep
                                             background in brand management at blue chip CPG companies with eCommerce
                                             growth marketing at the world's biggest retailer. I've run SingleFire I've
                                             created world-class campaigns; I've built digital marketing organizations
                                             from the ground up. I have over 20 years' experience leading... <a
                                                  href="pages-profile#!" class="text-primary">See more</a></p>
                                        <h4 class="card-title mb-2">My Approach :</h4>
                                        <p>When it comes to Project Head Manager, I believe in a holistic approach that
                                             combines creativity with technical expertise. I start by understanding your
                                             unique vision and goals, then work tirelessly to bring that vision to life.
                                             Whether you need a sleek portfolio site, an engaging e-commerce platform,
                                             or anything in between, I've got you covered.</p>
                                        <div class="row g-2 mt-2 mb-4">
                                             <div class="col-lg-6">
                                                  <div class="border p-3 rounded">
                                                       <h4 class="card-title">Marketing expertise</h4>
                                                       <div class="d-flex gap-2 flex-wrap mt-3">
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Leadership</span>
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Advertising</span>
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Public-relations</span>
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Branding-manage</span>
                                                       </div>
                                                       <p class="mb-0 text-dark mt-3">Open to networking :<span
                                                                 class="badge bg-success-subtle text-success ms-1">Yes</span>
                                                       </p>
                                                  </div>
                                             </div>
                                             <div class="col-lg-6">
                                                  <div class="border p-3 rounded">
                                                       <h4 class="card-title">Marketing interests</h4>
                                                       <div class="d-flex gap-2 flex-wrap mt-3">
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Event-marketing</span>
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Performance-marketing</span>
                                                            <span
                                                                 class="badge bg-body text-muted px-2 py-1 fs-12">#Account-based-marketing</span>
                                                       </div>
                                                       <p class="mb-0 text-dark mt-3">Open to advising :<span
                                                                 class="badge bg-success-subtle text-success ms-1">Yes</span>
                                                       </p>
                                                  </div>
                                             </div>
                                        </div>
                                        <h4 class="card-title">My Core Skills :</h4>
                                        <div class="row mt-2">
                                             <div class="col-lg-4">
                                                  <div class="d-flex align-items-center justify-content-satrt gap-2">
                                                       <ul class="d-flex text-warning m-0 fs-20 list-unstyled">
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                       </ul>
                                                       <p class="fw-medium mb-0 text-dark fs-15">Inbound Marketing</p>
                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="d-flex align-items-center justify-content-satrt gap-2">
                                                       <ul class="d-flex text-warning m-0 fs-20 list-unstyled">
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                       </ul>
                                                       <p class="fw-medium mb-0 text-dark fs-15">Entrepreneurship</p>
                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="d-flex align-items-center justify-content-satrt gap-2">
                                                       <ul class="d-flex text-warning m-0 fs-20 list-unstyled">
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                            <li>
                                                                 <i class="bx bxs-star"></i>
                                                            </li>
                                                       </ul>
                                                       <p class="fw-medium mb-0 text-dark fs-15">Growth Marketing</p>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="col-xl-4 col-lg-5">
                              <div class="row">
                                   <div class="col-lg-6">
                                        <div class="card">
                                             <div class="card-body text-center">
                                                  <div
                                                       class="avatar bg-info d-flex align-items-center justify-content-center rounded mx-auto mb-2">
                                                       <iconify-icon icon="solar:cup-star-bold"
                                                            class="fs-34 text-white"><template shadowrootmode="open">
                                                                 <style data-style="data-style">
                                                                      :host {
                                                                           display: inline-block;
                                                                           vertical-align: 0
                                                                      }

                                                                      span,
                                                                      svg {
                                                                           display: block
                                                                      }
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M22 8.162v.073c0 .86 0 1.291-.207 1.643s-.584.561-1.336.98l-.793.44c.546-1.848.729-3.834.796-5.532l.01-.221l.002-.052c.651.226 1.017.395 1.245.711c.283.393.283.915.283 1.958m-20 0v.073c0 .86 0 1.291.207 1.643s.584.561 1.336.98l.794.44c-.547-1.848-.73-3.834-.797-5.532l-.01-.221l-.001-.052c-.652.226-1.018.395-1.246.711C2 6.597 2 7.12 2 8.162">
                                                                      </path>
                                                                      <path fill="currentColor" fill-rule="evenodd"
                                                                           d="M12 2c1.784 0 3.253.157 4.377.347c1.139.192 1.708.288 2.184.874s.45 1.219.4 2.485c-.172 4.349-1.11 9.78-6.211 10.26V19.5h1.43a1 1 0 0 1 .98.804l.19.946H18a.75.75 0 0 1 0 1.5H6a.75.75 0 0 1 0-1.5h2.65l.19-.946a1 1 0 0 1 .98-.804h1.43v-3.534c-5.1-.48-6.038-5.912-6.21-10.26c-.051-1.266-.076-1.9.4-2.485c.475-.586 1.044-.682 2.183-.874A26.4 26.4 0 0 1 12 2m.952 4.199l-.098-.176C12.474 5.34 12.284 5 12 5s-.474.34-.854 1.023l-.098.176c-.108.194-.162.29-.246.354c-.085.064-.19.088-.4.135l-.19.044c-.738.167-1.107.25-1.195.532s.164.577.667 1.165l.13.152c.143.167.215.25.247.354s.021.215 0 .438l-.02.203c-.076.785-.114 1.178.115 1.352c.23.174.576.015 1.267-.303l.178-.082c.197-.09.295-.135.399-.135s.202.045.399.135l.178.082c.691.319 1.037.477 1.267.303s.191-.567.115-1.352l-.02-.203c-.021-.223-.032-.334 0-.438s.104-.187.247-.354l.13-.152c.503-.588.755-.882.667-1.165c-.088-.282-.457-.365-1.195-.532l-.19-.044c-.21-.047-.315-.07-.4-.135c-.084-.064-.138-.16-.246-.354"
                                                                           clip-rule="evenodd"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <h3 class="mb-1">+12</h3>
                                                  <p class="mb-0 fw-semibold fs-16">Achievements</p>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="col-lg-6">
                                        <div class="card">
                                             <div class="card-body text-center">
                                                  <div
                                                       class="avatar bg-info d-flex align-items-center justify-content-center rounded mx-auto mb-2">
                                                       <iconify-icon icon="solar:medal-star-circle-bold-duotone"
                                                            class="fs-34 text-white"><template shadowrootmode="open">
                                                                 <style data-style="data-style">
                                                                      :host {
                                                                           display: inline-block;
                                                                           vertical-align: 0
                                                                      }

                                                                      span,
                                                                      svg {
                                                                           display: block
                                                                      }
                                                                 </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                      width="1em" height="1em" viewBox="0 0 24 24">
                                                                      <path fill="currentColor"
                                                                           d="M13 2h-2c-1.886 0-2.828 0-3.414.586S7 4.114 7 6v4h10V6c0-1.886 0-2.828-.586-3.414S14.886 2 13 2"
                                                                           opacity=".5"></path>
                                                                      <path fill="currentColor" fill-rule="evenodd"
                                                                           d="M12 22a8 8 0 1 0 0-16a8 8 0 0 0 0 16m0-11c-.284 0-.474.34-.854 1.023l-.098.176c-.108.194-.162.29-.246.354c-.085.064-.19.088-.4.135l-.19.044c-.738.167-1.107.25-1.195.532s.164.577.667 1.165l.13.152c.143.167.215.25.247.354s.021.215 0 .438l-.02.203c-.076.785-.114 1.178.115 1.352c.23.174.576.015 1.267-.303l.178-.082c.197-.09.295-.136.399-.136s.202.046.399.136l.178.082c.691.319 1.037.477 1.267.303s.191-.567.115-1.352l-.02-.203c-.021-.223-.032-.334 0-.438s.104-.187.247-.354l.13-.152c.503-.588.755-.882.667-1.165c-.088-.282-.457-.365-1.195-.532l-.19-.044c-.21-.047-.315-.07-.4-.135c-.084-.064-.138-.16-.246-.354l-.098-.176C12.474 11.34 12.284 11 12 11"
                                                                           clip-rule="evenodd"></path>
                                                                 </svg>
                                                            </template></iconify-icon>
                                                  </div>
                                                  <h3 class="mb-1">+24</h3>
                                                  <p class="mb-0 fw-semibold fs-16">Accomplishments</p>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="card overflow-hidden z-1">
                                   <div class="card-body text-center">
                                        <h4 class="card-title mb-2">Share your profile</h4>
                                        <p class="text-muted">Now that your agency is created, go ahead and share it to
                                             start generating leads.</p>
                                        <img src="../webPage/admin/assets/images/qr-code.png" alt="" class="avatar-xl">
                                        <ul
                                             class="list-inline d-flex gap-1 my-3  align-items-center justify-content-center">
                                             <li class="list-inline-item">
                                                  <a href="javascript: void(0);"
                                                       class="btn btn-soft-primary avatar-sm d-flex align-items-center justify-content-center fs-20">
                                                       <i class="bx bxl-facebook"></i>
                                                  </a>
                                             </li>

                                             <li class="list-inline-item">
                                                  <a href="javascript: void(0);"
                                                       class="btn btn-soft-danger avatar-sm d-flex align-items-center justify-content-center fs-20">
                                                       <i class="bx bxl-instagram"></i>
                                                  </a>
                                             </li>

                                             <li class="list-inline-item">
                                                  <a href="javascript: void(0);"
                                                       class="btn btn-soft-info avatar-sm d-flex align-items-center justify-content-center  fs-20">
                                                       <i class="bx bxl-twitter"></i>
                                                  </a>
                                             </li>
                                             <li class="list-inline-item">
                                                  <a href="javascript: void(0);"
                                                       class="btn btn-soft-success avatar-sm d-flex align-items-center justify-content-center fs-20">
                                                       <i class="bx bxl-whatsapp"></i>
                                                  </a>
                                             </li>
                                             <li class="list-inline-item">
                                                  <a href="javascript: void(0);"
                                                       class="btn btn-soft-warning avatar-sm d-flex align-items-center justify-content-center fs-20">
                                                       <i class="bx bx-envelope"></i>
                                                  </a>
                                             </li>
                                        </ul>
                                        <p class="text-muted">Copy the URL below and share it with your friends:</p>
                                        <p
                                             class="d-flex align-items-center border p-2 rounded-2 border-dashed bg-body text-start mb-0">
                                             https://larkon-mileage.com <a href="pages-profile#!"
                                                  class="ms-auto fs-4"><i class="ti ti-copy"></i></a></p>
                                   </div>
                              </div>
                         </div>
                    </div>

                    <div class="row">
                         <div class="col-lg-3">
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Popular Filters</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="d-flex flex-wrap gap-2" role="group"
                                             aria-label="Basic checkbox toggle button group">
                                             <input type="checkbox" class="btn-check" id="all-topic" checked="">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="all-topic">All Topics (23)</label>

                                             <input type="checkbox" class="btn-check" id="saas">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="saas">#SaaS (21)</label>

                                             <input type="checkbox" class="btn-check" id="latam">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="latam">#LatAm (5)</label>

                                             <input type="checkbox" class="btn-check" id="inbound">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="inbound">#inbound (4)</label>

                                             <input type="checkbox" class="btn-check" id="europe">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="europe">#Europe (25)</label>

                                             <input type="checkbox" class="btn-check" id="performance">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="performance">#Performance-marketing (7)</label>

                                             <input type="checkbox" class="btn-check" id="facebook">
                                             <label
                                                  class="btn bg-body rounded-pill d-flex justify-content-center align-items-center"
                                                  for="facebook">#Facebook-advertising (8)</label>
                                        </div>
                                   </div>
                                   <div class="card-footer border-top text-center">
                                        <a href="pages-profile#!" class="link-primary">View More</a>
                                   </div>
                              </div>
                         </div>
                         <div class="col-lg-9">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2">
                                             <img src="../webPage/admin/assets/images/users/avatar-1.jpg" alt=""
                                                  class="avatar-md rounded-circle border border-light border-3">
                                             <div>
                                                  <h4 class="mb-1">Gaston Lapierre , <span
                                                            class="fs-13 text-muted fw-medium ms-1">Project Head Manager
                                                            . Nov 16</span></h4>
                                                  <p class="mb-0">Asked a question <a href="pages-profile#!"
                                                            class="text-primary ms-1">#inbound</a> <a
                                                            href="pages-profile#!"
                                                            class="text-primary ms-1">#SaaS</a></p>
                                             </div>
                                        </div>
                                        <h4 class="mt-3">Do you have any experience with deploying @Hubspot for a SaaS
                                             business with both a direct and self-serve model?</h4>
                                        <p class="mb-0">We are a Series A B2B startup offering a custom solution.
                                             Currently, we are utilizing @MixPanel and collaborating with @Division of
                                             Labor to rebuild our pages. Shoutout to @Jennifer Smith for her
                                             support...<a href="pages-profile#!" class="link-primary"> See more</a>
                                        </p>
                                   </div>
                                   <div class="card-footer border-top">
                                        <div class="row">
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-primary d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:pen-new-square-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Answer</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:hand-shake-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Thanks</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:lightbulb-minimalistic-broken"
                                                            class="fs-16"><template shadowrootmode="open">
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
                                                            </template></iconify-icon> Insightful</a>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2">
                                             <img src="../webPage/admin/assets/images/users/avatar-1.jpg" alt=""
                                                  class="avatar-md rounded-circle border border-light border-3">
                                             <div>
                                                  <h4 class="mb-1">Gaston Lapierre , <span
                                                            class="fs-13 text-muted fw-medium ms-1">Project Head Manager
                                                            . Nov 11</span></h4>
                                                  <p class="mb-0">Asked a question <a href="pages-profile#!"
                                                            class="text-primary ms-1">#LatAm</a> <a
                                                            href="pages-profile#!"
                                                            class="text-primary ms-1">#Europe</a></p>
                                             </div>
                                        </div>
                                        <h4 class="mt-3">Looking for a new landing page optimization vendor</h4>
                                        <p class="mb-0">We are currently using @Optimizely, but find that they are
                                             missing a number with a custom solution that no... <a
                                                  href="pages-profile#!" class="link-primary"> See more</a></p>
                                   </div>
                                   <div class="card-footer border-top">
                                        <div class="row">
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-primary d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:pen-new-square-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Answer</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:hand-shake-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Thanks</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:lightbulb-minimalistic-broken"
                                                            class="fs-16"><template shadowrootmode="open">
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
                                                            </template></iconify-icon> Insightful</a>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2">
                                             <img src="../webPage/admin/assets/images/users/avatar-1.jpg" alt=""
                                                  class="avatar-md rounded-circle border border-light border-3">
                                             <div>
                                                  <h4 class="mb-1">Gaston Lapierre , <span
                                                            class="fs-13 text-muted fw-medium ms-1">Project Head Manager
                                                            . Nov 08</span></h4>
                                                  <p class="mb-0">Asked a question <a href="pages-profile#!"
                                                            class="text-primary ms-1">#Performance-marketing</a> <a
                                                            href="pages-profile#!"
                                                            class="text-primary ms-1">#CRM</a></p>
                                             </div>
                                        </div>
                                        <h4 class="mt-3">Why Your Company Needs a CRM to Grow Better?</h4>
                                        <p class="mb-0">CRMs are powerful tools that help you expedite business growth
                                             while number with a custom eliminating friction, improving cross-team
                                             collaboration, managing your contact records, syncing...<a
                                                  href="pages-profile#!" class="link-primary"> See more</a></p>
                                   </div>
                                   <div class="card-footer border-top">
                                        <div class="row">
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-primary d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:pen-new-square-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Answer</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:hand-shake-broken" class="fs-16"><template
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
                                                            </template></iconify-icon> Thanks</a>
                                             </div>
                                             <div class="col-lg-2 col-4">
                                                  <a href="pages-profile#!"
                                                       class="text-dark d-inline-flex gap-1 align-items-center fs-14"><iconify-icon
                                                            icon="solar:lightbulb-minimalistic-broken"
                                                            class="fs-16"><template shadowrootmode="open">
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
                                                            </template></iconify-icon> Insightful</a>
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

     <!-- Page Js -->
     <!-- <script src="../webPage/admin/assets/js/pages/profile.js"></script> -->




     <svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
          xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
          style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
          <defs id="SvgjsDefs1002"></defs>
          <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
          <path id="SvgjsPath1004" d="M0 0 "></path>
     </svg>
</body>

</html>