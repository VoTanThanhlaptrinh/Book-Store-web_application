<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0045)role-add -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Title Meta -->

    <title>Role Add | Larkon - Responsive Admin Dashboard Template</title>
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
                                        aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
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
                                                            <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">
                                                                Report-Fix / Update </h5>
                                                            <p class="d-flex align-items-center">Add 3 files to <span
                                                                    class=" d-flex align-items-center text-primary ms-1"><iconify-icon
                                                                        icon="iconamoon:file-light"><template
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
                                                                        </template></iconify-icon> Tasks</span></p>
                                                            <div class="bg-light bg-opacity-50 rounded-2 p-2">
                                                                <div class="row">
                                                                    <div class="col-lg-6 border-end border-light">
                                                                        <div class="d-flex align-items-center gap-2">
                                                                            <i class="bx bxl-figma fs-20 text-red"></i>
                                                                            <a href="role-add#!"
                                                                                class="text-dark fw-medium">Concept.fig</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="d-flex align-items-center gap-2">
                                                                            <i
                                                                                class="bx bxl-file-doc fs-20 text-success"></i>
                                                                            <a href="role-add#!"
                                                                                class="text-dark fw-medium">larkon.docs</a>
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
                                                            <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Project
                                                                Status
                                                            </h5>
                                                            <p class="d-flex align-items-center mb-0">Marked<span
                                                                    class=" d-flex align-items-center text-primary mx-1"><iconify-icon
                                                                        icon="iconamoon:file-light"><template
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
                                                                        </template></iconify-icon> Design </span> as
                                                                <span
                                                                    class="badge bg-success-subtle text-success px-2 py-1 ms-1">
                                                                    Completed</span></p>
                                                            <div
                                                                class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
                                                                <a href="role-add#!"
                                                                    class="fw-medium text-dark">UI/UX Figma Design</a>
                                                                <div class="ms-auto">
                                                                    <a href="role-add#!"
                                                                        class="fw-medium text-primary fs-18"
                                                                        data-bs-toggle="tooltip"
                                                                        data-bs-title="Download"
                                                                        data-bs-placement="bottom"><iconify-icon
                                                                            icon="iconamoon:cloud-download-duotone"><template
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
                                                            </div>
                                                            <h6 class="mt-3 text-muted">Monday , 3:00 PM</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="position-relative ps-4">
                                                    <div class="mb-4">
                                                        <span
                                                            class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16">UI</span>
                                                        <div class="ms-2">
                                                            <h5 class="mb-1 text-dark fw-semibold fs-15">Larkon
                                                                Application UI v2.0.0 <span
                                                                    class="badge bg-primary-subtle text-primary px-2 py-1 ms-1">
                                                                    Latest</span>
                                                            </h5>
                                                            <p>Get access to over 20+ pages including a dashboard
                                                                layout, charts, kanban board, calendar, and pre-order
                                                                E-commerce &amp; Marketing pages.</p>
                                                            <div class="mt-2">
                                                                <a href="role-add#!"
                                                                    class="btn btn-light btn-sm">Download Zip</a>
                                                            </div>
                                                            <h6 class="mt-3 text-muted">Monday , 2:10 PM</h6>
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
                                                            <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Alex
                                                                Smith Attached Photos
                                                            </h5>
                                                            <div class="row g-2 mt-2">
                                                                <div class="col-lg-4">
                                                                    <a href="role-list#!">
                                                                        <img src="../webPage/admin/assets/images/small/img-6.jpg" alt=""
                                                                            class="img-fluid rounded">
                                                                    </a>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <a href="role-list#!">
                                                                        <img src="../webPage/admin/assets/images/small/img-3.jpg" alt=""
                                                                            class="img-fluid rounded">
                                                                    </a>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <a href="role-list#!">
                                                                        <img src="../webPage/admin/assets/images/small/img-4.jpg" alt=""
                                                                            class="img-fluid rounded">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <h6 class="mt-3 text-muted">Monday 1:00 PM</h6>
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
                                                            <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Rebecca
                                                                J. added a new team member
                                                            </h5>
                                                            <p class="d-flex align-items-center gap-1"><iconify-icon
                                                                    icon="iconamoon:check-circle-1-duotone"
                                                                    class="text-success"><template
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
                                                                    </template></iconify-icon> Added a new member to
                                                                Front Dashboard</p>
                                                            <h6 class="mt-3 text-muted">Monday 10:00 AM</h6>
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
                                                            <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                Achievements
                                                            </h5>
                                                            <p class="d-flex align-items-center gap-1 mt-1">Earned a
                                                                <iconify-icon icon="iconamoon:certificate-badge-duotone"
                                                                    class="text-danger fs-20"><template
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
                                                                    </template></iconify-icon>" Best Product Award"</p>
                                                            <h6 class="mt-3 text-muted">Monday 9:30 AM</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="role-add#!" class="btn btn-outline-dark w-100">View All</a>
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
                                style="height: 361px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
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
                                        aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                                        <div class="simplebar-content" style="padding: 0px;">
                                            <div class="p-3 settings-bar">

                                                <div>
                                                    <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-bs-theme" id="layout-color-light" value="light">
                                                        <label class="form-check-label"
                                                            for="layout-color-light">Light</label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-bs-theme" id="layout-color-dark" value="dark">
                                                        <label class="form-check-label"
                                                            for="layout-color-dark">Dark</label>
                                                    </div>
                                                </div>

                                                <div>
                                                    <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-topbar-color" id="topbar-color-light"
                                                            value="light">
                                                        <label class="form-check-label"
                                                            for="topbar-color-light">Light</label>
                                                    </div>
                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-topbar-color" id="topbar-color-dark"
                                                            value="dark">
                                                        <label class="form-check-label"
                                                            for="topbar-color-dark">Dark</label>
                                                    </div>
                                                </div>


                                                <div>
                                                    <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-color" id="leftbar-color-light"
                                                            value="light">
                                                        <label class="form-check-label" for="leftbar-color-light">
                                                            Light
                                                        </label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-color" id="leftbar-color-dark" value="dark">
                                                        <label class="form-check-label" for="leftbar-color-dark">
                                                            Dark
                                                        </label>
                                                    </div>
                                                </div>

                                                <div>
                                                    <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-size" id="leftbar-size-default"
                                                            value="default">
                                                        <label class="form-check-label" for="leftbar-size-default">
                                                            Default
                                                        </label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-size" id="leftbar-size-small"
                                                            value="condensed">
                                                        <label class="form-check-label" for="leftbar-size-small">
                                                            Condensed
                                                        </label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-size" id="leftbar-hidden" value="hidden">
                                                        <label class="form-check-label" for="leftbar-hidden">
                                                            Hidden
                                                        </label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-size" id="leftbar-size-small-hover-active"
                                                            value="sm-hover-active">
                                                        <label class="form-check-label"
                                                            for="leftbar-size-small-hover-active">
                                                            Small Hover Active
                                                        </label>
                                                    </div>

                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio"
                                                            name="data-menu-size" id="leftbar-size-small-hover"
                                                            value="sm-hover">
                                                        <label class="form-check-label" for="leftbar-size-small-hover">
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
                                style="height: 484px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
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
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Roles Information</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form>
                                            <div class="mb-3">
                                                <label for="roles-name" class="form-label">Roles Name</label>
                                                <input type="text" id="roles-name" class="form-control"
                                                    placeholder="Role name">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-lg-6">
                                        <form>
                                            <div class="mb-3">
                                                <label for="workspace" class="form-label">Add Workspace</label>
                                                <div class="choices" data-type="select-one" tabindex="0" role="combobox"
                                                    aria-autocomplete="list" aria-haspopup="true" aria-expanded="false">
                                                    <div class="choices__inner"><select
                                                            class="form-control choices__input" id="workspace"
                                                            data-choices="" data-choices-groups=""
                                                            data-placeholder="Select Workspace" hidden="" tabindex="-1"
                                                            data-choice="active">
                                                            <option value="Select Workspace"
                                                                data-custom-properties="[object Object]">Select
                                                                Workspace</option>
                                                        </select>
                                                        <div class="choices__list choices__list--single">
                                                            <div class="choices__item choices__item--selectable"
                                                                data-item="" data-id="1" data-value="Select Workspace"
                                                                data-custom-properties="[object Object]"
                                                                aria-selected="true">Select Workspace</div>
                                                        </div>
                                                    </div>
                                                    <div class="choices__list choices__list--dropdown"
                                                        aria-expanded="false"><input type="search" name="search_terms"
                                                            class="choices__input choices__input--cloned"
                                                            autocomplete="off" autocapitalize="off" spellcheck="false"
                                                            role="textbox" aria-autocomplete="list"
                                                            aria-label="This is a placeholder set in the config"
                                                            placeholder="">
                                                        <div class="choices__list" role="listbox">
                                                            <div id="choices--workspace-item-choice-2"
                                                                class="choices__item choices__item--choice choices__item--selectable is-highlighted"
                                                                role="option" data-choice="" data-id="2"
                                                                data-value="Analytics"
                                                                data-select-text="Press to select"
                                                                data-choice-selectable="" aria-selected="true">Analytics
                                                            </div>
                                                            <div id="choices--workspace-item-choice-3"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="3"
                                                                data-value="Facebook" data-select-text="Press to select"
                                                                data-choice-selectable="">Facebook</div>
                                                            <div id="choices--workspace-item-choice-4"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="4"
                                                                data-value="Mail" data-select-text="Press to select"
                                                                data-choice-selectable="">Mail</div>
                                                            <div id="choices--workspace-item-choice-5"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="5"
                                                                data-value="Meet" data-select-text="Press to select"
                                                                data-choice-selectable="">Meet</div>
                                                            <div id="choices--workspace-item-choice-1"
                                                                class="choices__item choices__item--choice is-selected choices__item--selectable"
                                                                role="option" data-choice="" data-id="1"
                                                                data-value="Select Workspace"
                                                                data-select-text="Press to select"
                                                                data-choice-selectable="">Select Workspace</div>
                                                            <div id="choices--workspace-item-choice-6"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="6"
                                                                data-value="Slack" data-select-text="Press to select"
                                                                data-choice-selectable="">Slack</div>
                                                            <div id="choices--workspace-item-choice-7"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="7"
                                                                data-value="Strip" data-select-text="Press to select"
                                                                data-choice-selectable="">Strip</div>
                                                            <div id="choices--workspace-item-choice-8"
                                                                class="choices__item choices__item--choice choices__item--selectable"
                                                                role="option" data-choice="" data-id="8"
                                                                data-value="Zoom" data-select-text="Press to select"
                                                                data-choice-selectable="">Zoom</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="role-tag" class="form-label">Tag</label>
                                            <div class="choices" data-type="select-multiple" role="combobox"
                                                aria-autocomplete="list" aria-haspopup="true" aria-expanded="false">
                                                <div class="choices__inner"><select class="form-control choices__input"
                                                        id="choices-multiple-remove-button" data-choices=""
                                                        data-choices-removeitem="" name="choices-multiple-remove-button"
                                                        multiple="" hidden="" tabindex="-1"
                                                        data-choice="active"></select>
                                                    <div class="choices__list choices__list--multiple"></div><input
                                                        type="search" name="search_terms"
                                                        class="choices__input choices__input--cloned" autocomplete="off"
                                                        autocapitalize="off" spellcheck="false" role="textbox"
                                                        aria-autocomplete="list" aria-label="null">
                                                </div>
                                                <div class="choices__list choices__list--dropdown"
                                                    aria-expanded="false">
                                                    <div class="choices__list" aria-multiselectable="true"
                                                        role="listbox">
                                                        <div id="choices--choices-multiple-remove-button-item-choice-1"
                                                            class="choices__item choices__item--choice choices__item--selectable is-highlighted"
                                                            role="option" data-choice="" data-id="1" data-value="Data"
                                                            data-select-text="Press to select" data-choice-selectable=""
                                                            aria-selected="true">Data</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-2"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="2"
                                                            data-value="Designer" data-select-text="Press to select"
                                                            data-choice-selectable="">Designer</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-3"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="3"
                                                            data-value="Manager" data-select-text="Press to select"
                                                            data-choice-selectable="">Manager</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-4"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="4"
                                                            data-value="Product" data-select-text="Press to select"
                                                            data-choice-selectable="">Product</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-5"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="5" data-value="QA"
                                                            data-select-text="Press to select"
                                                            data-choice-selectable="">QA</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-6"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="6"
                                                            data-value="Supporter" data-select-text="Press to select"
                                                            data-choice-selectable="">Supporter</div>
                                                        <div id="choices--choices-multiple-remove-button-item-choice-7"
                                                            class="choices__item choices__item--choice choices__item--selectable"
                                                            role="option" data-choice="" data-id="7"
                                                            data-value="System Design"
                                                            data-select-text="Press to select"
                                                            data-choice-selectable="">System Design</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label for="user-name" class="form-label">User Name</label>
                                            <input type="text" id="user-name" class="form-control"
                                                placeholder="Enter name">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <p>User Status </p>
                                        <div class="d-flex gap-2 align-items-center">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                    id="flexRadioDefault1" checked="">
                                                <label class="form-check-label" for="flexRadioDefault1">
                                                    Active
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                    id="flexRadioDefault2">
                                                <label class="form-check-label" for="flexRadioDefault2">
                                                    In Active
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer border-top">
                                <a href="role-add#!" class="btn btn-primary">Create Roles</a>
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