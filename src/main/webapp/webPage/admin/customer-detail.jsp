<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)customer-detail# -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Customer Details | Larkon - Responsive Admin Dashboard Template</title>
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
     <style id="apexcharts-css">
          @keyframes opaque {
               0% {
                    opacity: 0
               }

               to {
                    opacity: 1
               }
          }

          @keyframes resizeanim {

               0%,
               to {
                    opacity: 0
               }
          }

          .apexcharts-canvas {
               position: relative;
               user-select: none
          }

          .apexcharts-canvas ::-webkit-scrollbar {
               -webkit-appearance: none;
               width: 6px
          }

          .apexcharts-canvas ::-webkit-scrollbar-thumb {
               border-radius: 4px;
               background-color: rgba(0, 0, 0, .5);
               box-shadow: 0 0 1px rgba(255, 255, 255, .5);
               -webkit-box-shadow: 0 0 1px rgba(255, 255, 255, .5)
          }

          .apexcharts-inner {
               position: relative
          }

          .apexcharts-text tspan {
               font-family: inherit
          }

          .legend-mouseover-inactive {
               transition: .15s ease all;
               opacity: .2
          }

          .apexcharts-legend-text {
               padding-left: 15px;
               margin-left: -15px;
          }

          .apexcharts-series-collapsed {
               opacity: 0
          }

          .apexcharts-tooltip {
               border-radius: 5px;
               box-shadow: 2px 2px 6px -4px #999;
               cursor: default;
               font-size: 14px;
               left: 62px;
               opacity: 0;
               pointer-events: none;
               position: absolute;
               top: 20px;
               display: flex;
               flex-direction: column;
               overflow: hidden;
               white-space: nowrap;
               z-index: 12;
               transition: .15s ease all
          }

          .apexcharts-tooltip.apexcharts-active {
               opacity: 1;
               transition: .15s ease all
          }

          .apexcharts-tooltip.apexcharts-theme-light {
               border: 1px solid #e3e3e3;
               background: rgba(255, 255, 255, .96)
          }

          .apexcharts-tooltip.apexcharts-theme-dark {
               color: #fff;
               background: rgba(30, 30, 30, .8)
          }

          .apexcharts-tooltip * {
               font-family: inherit
          }

          .apexcharts-tooltip-title {
               padding: 6px;
               font-size: 15px;
               margin-bottom: 4px
          }

          .apexcharts-tooltip.apexcharts-theme-light .apexcharts-tooltip-title {
               background: #eceff1;
               border-bottom: 1px solid #ddd
          }

          .apexcharts-tooltip.apexcharts-theme-dark .apexcharts-tooltip-title {
               background: rgba(0, 0, 0, .7);
               border-bottom: 1px solid #333
          }

          .apexcharts-tooltip-text-goals-value,
          .apexcharts-tooltip-text-y-value,
          .apexcharts-tooltip-text-z-value {
               display: inline-block;
               margin-left: 5px;
               font-weight: 600
          }

          .apexcharts-tooltip-text-goals-label:empty,
          .apexcharts-tooltip-text-goals-value:empty,
          .apexcharts-tooltip-text-y-label:empty,
          .apexcharts-tooltip-text-y-value:empty,
          .apexcharts-tooltip-text-z-value:empty,
          .apexcharts-tooltip-title:empty {
               display: none
          }

          .apexcharts-tooltip-text-goals-label,
          .apexcharts-tooltip-text-goals-value {
               padding: 6px 0 5px
          }

          .apexcharts-tooltip-goals-group,
          .apexcharts-tooltip-text-goals-label,
          .apexcharts-tooltip-text-goals-value {
               display: flex
          }

          .apexcharts-tooltip-text-goals-label:not(:empty),
          .apexcharts-tooltip-text-goals-value:not(:empty) {
               margin-top: -6px
          }

          .apexcharts-tooltip-marker {
               width: 12px;
               height: 12px;
               position: relative;
               top: 0;
               margin-right: 10px;
               border-radius: 50%
          }

          .apexcharts-tooltip-series-group {
               padding: 0 10px;
               display: none;
               text-align: left;
               justify-content: left;
               align-items: center
          }

          .apexcharts-tooltip-series-group.apexcharts-active .apexcharts-tooltip-marker {
               opacity: 1
          }

          .apexcharts-tooltip-series-group.apexcharts-active,
          .apexcharts-tooltip-series-group:last-child {
               padding-bottom: 4px
          }

          .apexcharts-tooltip-series-group-hidden {
               opacity: 0;
               height: 0;
               line-height: 0;
               padding: 0 !important
          }

          .apexcharts-tooltip-y-group {
               padding: 6px 0 5px
          }

          .apexcharts-custom-tooltip,
          .apexcharts-tooltip-box {
               padding: 4px 8px
          }

          .apexcharts-tooltip-boxPlot {
               display: flex;
               flex-direction: column-reverse
          }

          .apexcharts-tooltip-box>div {
               margin: 4px 0
          }

          .apexcharts-tooltip-box span.value {
               font-weight: 700
          }

          .apexcharts-tooltip-rangebar {
               padding: 5px 8px
          }

          .apexcharts-tooltip-rangebar .category {
               font-weight: 600;
               color: #777
          }

          .apexcharts-tooltip-rangebar .series-name {
               font-weight: 700;
               display: block;
               margin-bottom: 5px
          }

          .apexcharts-xaxistooltip,
          .apexcharts-yaxistooltip {
               opacity: 0;
               pointer-events: none;
               color: #373d3f;
               font-size: 13px;
               text-align: center;
               border-radius: 2px;
               position: absolute;
               z-index: 10;
               background: #eceff1;
               border: 1px solid #90a4ae
          }

          .apexcharts-xaxistooltip {
               padding: 9px 10px;
               transition: .15s ease all
          }

          .apexcharts-xaxistooltip.apexcharts-theme-dark {
               background: rgba(0, 0, 0, .7);
               border: 1px solid rgba(0, 0, 0, .5);
               color: #fff
          }

          .apexcharts-xaxistooltip:after,
          .apexcharts-xaxistooltip:before {
               left: 50%;
               border: solid transparent;
               content: " ";
               height: 0;
               width: 0;
               position: absolute;
               pointer-events: none
          }

          .apexcharts-xaxistooltip:after {
               border-color: transparent;
               border-width: 6px;
               margin-left: -6px
          }

          .apexcharts-xaxistooltip:before {
               border-color: transparent;
               border-width: 7px;
               margin-left: -7px
          }

          .apexcharts-xaxistooltip-bottom:after,
          .apexcharts-xaxistooltip-bottom:before {
               bottom: 100%
          }

          .apexcharts-xaxistooltip-top:after,
          .apexcharts-xaxistooltip-top:before {
               top: 100%
          }

          .apexcharts-xaxistooltip-bottom:after {
               border-bottom-color: #eceff1
          }

          .apexcharts-xaxistooltip-bottom:before {
               border-bottom-color: #90a4ae
          }

          .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:after,
          .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:before {
               border-bottom-color: rgba(0, 0, 0, .5)
          }

          .apexcharts-xaxistooltip-top:after {
               border-top-color: #eceff1
          }

          .apexcharts-xaxistooltip-top:before {
               border-top-color: #90a4ae
          }

          .apexcharts-xaxistooltip-top.apexcharts-theme-dark:after,
          .apexcharts-xaxistooltip-top.apexcharts-theme-dark:before {
               border-top-color: rgba(0, 0, 0, .5)
          }

          .apexcharts-xaxistooltip.apexcharts-active {
               opacity: 1;
               transition: .15s ease all
          }

          .apexcharts-yaxistooltip {
               padding: 4px 10px
          }

          .apexcharts-yaxistooltip.apexcharts-theme-dark {
               background: rgba(0, 0, 0, .7);
               border: 1px solid rgba(0, 0, 0, .5);
               color: #fff
          }

          .apexcharts-yaxistooltip:after,
          .apexcharts-yaxistooltip:before {
               top: 50%;
               border: solid transparent;
               content: " ";
               height: 0;
               width: 0;
               position: absolute;
               pointer-events: none
          }

          .apexcharts-yaxistooltip:after {
               border-color: transparent;
               border-width: 6px;
               margin-top: -6px
          }

          .apexcharts-yaxistooltip:before {
               border-color: transparent;
               border-width: 7px;
               margin-top: -7px
          }

          .apexcharts-yaxistooltip-left:after,
          .apexcharts-yaxistooltip-left:before {
               left: 100%
          }

          .apexcharts-yaxistooltip-right:after,
          .apexcharts-yaxistooltip-right:before {
               right: 100%
          }

          .apexcharts-yaxistooltip-left:after {
               border-left-color: #eceff1
          }

          .apexcharts-yaxistooltip-left:before {
               border-left-color: #90a4ae
          }

          .apexcharts-yaxistooltip-left.apexcharts-theme-dark:after,
          .apexcharts-yaxistooltip-left.apexcharts-theme-dark:before {
               border-left-color: rgba(0, 0, 0, .5)
          }

          .apexcharts-yaxistooltip-right:after {
               border-right-color: #eceff1
          }

          .apexcharts-yaxistooltip-right:before {
               border-right-color: #90a4ae
          }

          .apexcharts-yaxistooltip-right.apexcharts-theme-dark:after,
          .apexcharts-yaxistooltip-right.apexcharts-theme-dark:before {
               border-right-color: rgba(0, 0, 0, .5)
          }

          .apexcharts-yaxistooltip.apexcharts-active {
               opacity: 1
          }

          .apexcharts-yaxistooltip-hidden {
               display: none
          }

          .apexcharts-xcrosshairs,
          .apexcharts-ycrosshairs {
               pointer-events: none;
               opacity: 0;
               transition: .15s ease all
          }

          .apexcharts-xcrosshairs.apexcharts-active,
          .apexcharts-ycrosshairs.apexcharts-active {
               opacity: 1;
               transition: .15s ease all
          }

          .apexcharts-ycrosshairs-hidden {
               opacity: 0
          }

          .apexcharts-selection-rect {
               cursor: move
          }

          .svg_select_boundingRect,
          .svg_select_points_rot {
               pointer-events: none;
               opacity: 0;
               visibility: hidden
          }

          .apexcharts-selection-rect+g .svg_select_boundingRect,
          .apexcharts-selection-rect+g .svg_select_points_rot {
               opacity: 0;
               visibility: hidden
          }

          .apexcharts-selection-rect+g .svg_select_points_l,
          .apexcharts-selection-rect+g .svg_select_points_r {
               cursor: ew-resize;
               opacity: 1;
               visibility: visible
          }

          .svg_select_points {
               fill: #efefef;
               stroke: #333;
               rx: 2
          }

          .apexcharts-svg.apexcharts-zoomable.hovering-zoom {
               cursor: crosshair
          }

          .apexcharts-svg.apexcharts-zoomable.hovering-pan {
               cursor: move
          }

          .apexcharts-menu-icon,
          .apexcharts-pan-icon,
          .apexcharts-reset-icon,
          .apexcharts-selection-icon,
          .apexcharts-toolbar-custom-icon,
          .apexcharts-zoom-icon,
          .apexcharts-zoomin-icon,
          .apexcharts-zoomout-icon {
               cursor: pointer;
               width: 20px;
               height: 20px;
               line-height: 24px;
               color: #6e8192;
               text-align: center
          }

          .apexcharts-menu-icon svg,
          .apexcharts-reset-icon svg,
          .apexcharts-zoom-icon svg,
          .apexcharts-zoomin-icon svg,
          .apexcharts-zoomout-icon svg {
               fill: #6e8192
          }

          .apexcharts-selection-icon svg {
               fill: #444;
               transform: scale(.76)
          }

          .apexcharts-theme-dark .apexcharts-menu-icon svg,
          .apexcharts-theme-dark .apexcharts-pan-icon svg,
          .apexcharts-theme-dark .apexcharts-reset-icon svg,
          .apexcharts-theme-dark .apexcharts-selection-icon svg,
          .apexcharts-theme-dark .apexcharts-toolbar-custom-icon svg,
          .apexcharts-theme-dark .apexcharts-zoom-icon svg,
          .apexcharts-theme-dark .apexcharts-zoomin-icon svg,
          .apexcharts-theme-dark .apexcharts-zoomout-icon svg {
               fill: #f3f4f5
          }

          .apexcharts-canvas .apexcharts-reset-zoom-icon.apexcharts-selected svg,
          .apexcharts-canvas .apexcharts-selection-icon.apexcharts-selected svg,
          .apexcharts-canvas .apexcharts-zoom-icon.apexcharts-selected svg {
               fill: #008ffb
          }

          .apexcharts-theme-light .apexcharts-menu-icon:hover svg,
          .apexcharts-theme-light .apexcharts-reset-icon:hover svg,
          .apexcharts-theme-light .apexcharts-selection-icon:not(.apexcharts-selected):hover svg,
          .apexcharts-theme-light .apexcharts-zoom-icon:not(.apexcharts-selected):hover svg,
          .apexcharts-theme-light .apexcharts-zoomin-icon:hover svg,
          .apexcharts-theme-light .apexcharts-zoomout-icon:hover svg {
               fill: #333
          }

          .apexcharts-menu-icon,
          .apexcharts-selection-icon {
               position: relative
          }

          .apexcharts-reset-icon {
               margin-left: 5px
          }

          .apexcharts-menu-icon,
          .apexcharts-reset-icon,
          .apexcharts-zoom-icon {
               transform: scale(.85)
          }

          .apexcharts-zoomin-icon,
          .apexcharts-zoomout-icon {
               transform: scale(.7)
          }

          .apexcharts-zoomout-icon {
               margin-right: 3px
          }

          .apexcharts-pan-icon {
               transform: scale(.62);
               position: relative;
               left: 1px;
               top: 0
          }

          .apexcharts-pan-icon svg {
               fill: #fff;
               stroke: #6e8192;
               stroke-width: 2
          }

          .apexcharts-pan-icon.apexcharts-selected svg {
               stroke: #008ffb
          }

          .apexcharts-pan-icon:not(.apexcharts-selected):hover svg {
               stroke: #333
          }

          .apexcharts-toolbar {
               position: absolute;
               z-index: 11;
               max-width: 176px;
               text-align: right;
               border-radius: 3px;
               padding: 0 6px 2px;
               display: flex;
               justify-content: space-between;
               align-items: center
          }

          .apexcharts-menu {
               background: #fff;
               position: absolute;
               top: 100%;
               border: 1px solid #ddd;
               border-radius: 3px;
               padding: 3px;
               right: 10px;
               opacity: 0;
               min-width: 110px;
               transition: .15s ease all;
               pointer-events: none
          }

          .apexcharts-menu.apexcharts-menu-open {
               opacity: 1;
               pointer-events: all;
               transition: .15s ease all
          }

          .apexcharts-menu-item {
               padding: 6px 7px;
               font-size: 12px;
               cursor: pointer
          }

          .apexcharts-theme-light .apexcharts-menu-item:hover {
               background: #eee
          }

          .apexcharts-theme-dark .apexcharts-menu {
               background: rgba(0, 0, 0, .7);
               color: #fff
          }

          @media screen and (min-width:768px) {
               .apexcharts-canvas:hover .apexcharts-toolbar {
                    opacity: 1
               }
          }

          .apexcharts-canvas .apexcharts-element-hidden,
          .apexcharts-datalabel.apexcharts-element-hidden,
          .apexcharts-hide .apexcharts-series-points {
               opacity: 0
          }

          .apexcharts-hidden-element-shown {
               opacity: 1;
               transition: 0.25s ease all;
          }

          .apexcharts-datalabel,
          .apexcharts-datalabel-label,
          .apexcharts-datalabel-value,
          .apexcharts-datalabels,
          .apexcharts-pie-label {
               cursor: default;
               pointer-events: none
          }

          .apexcharts-pie-label-delay {
               opacity: 0;
               animation-name: opaque;
               animation-duration: .3s;
               animation-fill-mode: forwards;
               animation-timing-function: ease
          }

          .apexcharts-radialbar-label {
               cursor: pointer;
          }

          .apexcharts-annotation-rect,
          .apexcharts-area-series .apexcharts-area,
          .apexcharts-area-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
          .apexcharts-gridline,
          .apexcharts-line,
          .apexcharts-line-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
          .apexcharts-point-annotation-label,
          .apexcharts-radar-series path,
          .apexcharts-radar-series polygon,
          .apexcharts-toolbar svg,
          .apexcharts-tooltip .apexcharts-marker,
          .apexcharts-xaxis-annotation-label,
          .apexcharts-yaxis-annotation-label,
          .apexcharts-zoom-rect {
               pointer-events: none
          }

          .apexcharts-marker {
               transition: .15s ease all
          }

          .resize-triggers {
               animation: 1ms resizeanim;
               visibility: hidden;
               opacity: 0;
               height: 100%;
               width: 100%;
               overflow: hidden
          }

          .contract-trigger:before,
          .resize-triggers,
          .resize-triggers>div {
               content: " ";
               display: block;
               position: absolute;
               top: 0;
               left: 0
          }

          .resize-triggers>div {
               height: 100%;
               width: 100%;
               background: #eee;
               overflow: auto
          }

          .contract-trigger:before {
               overflow: hidden;
               width: 200%;
               height: 200%
          }

          .apexcharts-bar-goals-markers {
               pointer-events: none
          }

          .apexcharts-bar-shadows {
               pointer-events: none
          }

          .apexcharts-rangebar-goals-markers {
               pointer-events: none
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
                                                                                               <a href="customer-detail#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="customer-detail#!"
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
                                                                                <a href="customer-detail#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="customer-detail#!"
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
                                                                                <a href="customer-detail#!"
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
                                                                                Front Dashboard
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
                                                       <a href="customer-detail#!"
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
          <div>

               <div class="page-content">

                    <!-- Start Container Fluid -->
                    <div class="container-xxl">


                         <div class="row">
                              <div class="col-lg-4">
                                   <div class="card overflow-hidden">
                                        <div class="card-body">
                                             <div
                                                  class="bg-primary profile-bg rounded-top p-5 position-relative mx-n3 mt-n3">
                                                  <img src="../webPage/admin/assets/images/users/avatar-2.jpg" alt=""
                                                       class="avatar-lg border border-light border-3 rounded-circle position-absolute top-100 start-0 translate-middle ms-5">
                                             </div>
                                             <div class="mt-4 pt-3">
                                                  <h4 class="mb-1"> Michael A. Miner<i
                                                            class="bx bxs-badge-check text-success align-middle"></i>
                                                  </h4>
                                                  <div class="mt-2">
                                                       <a href="customer-detail#!"
                                                            class="link-primary fs-15">@michael_cus_2024</a>
                                                       <p class="fs-15 mb-1 mt-1"><span
                                                                 class="text-dark fw-semibold">Email : </span>
                                                            michaelaminer@dayrep.com</p>
                                                       <p class="fs-15 mb-0 mt-1"><span
                                                                 class="text-dark fw-semibold">Phone : </span> +28 (57)
                                                            760-010-27</p>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card-footer border-top gap-1 hstack">
                                             <a href="customer-detail#!" class="btn btn-primary w-100">Send
                                                  Message</a>
                                             <a href="customer-detail#!" class="btn btn-light w-100">Analytics</a>
                                             <a href="customer-detail#!"
                                                  class="btn btn-soft-dark d-inline-flex align-items-center justify-content-center rounded avatar-sm"><i
                                                       class="bx bx-edit-alt fs-18"></i></a>
                                        </div>
                                   </div>

                                   <div class="card">
                                        <div class="card-header d-flex align-items-center justify-content-between">
                                             <div>
                                                  <h4 class="card-title">Customer Details</h4>
                                             </div>
                                             <div>
                                                  <span class="badge bg-success-subtle text-success px-2 py-1">Active
                                                       User</span>
                                             </div>

                                        </div>
                                        <div class="card-body py-2">
                                             <div class="table-responsive">
                                                  <table class="table mb-0">
                                                       <tbody>
                                                            <tr>
                                                                 <td class="px-0">
                                                                      <p
                                                                           class="d-flex mb-0 align-items-center gap-1 fw-semibold text-dark">
                                                                           Account ID : </p>
                                                                 </td>
                                                                 <td class="text-dark fw-medium px-0">#AC-278699</td>
                                                            </tr>
                                                            <tr>
                                                                 <td class="px-0">
                                                                      <p
                                                                           class="d-flex mb-0 align-items-center gap-1 fw-semibold text-dark">
                                                                           Invoice Email : </p>
                                                                 </td>
                                                                 <td class="text-dark fw-medium px-0">
                                                                      michaelaminer@dayrep.com</td>
                                                            </tr>
                                                            <tr>
                                                                 <td class="px-0">
                                                                      <p
                                                                           class="d-flex mb-0 align-items-center gap-1 fw-semibold text-dark">
                                                                           Delivery Address : </p>
                                                                 </td>
                                                                 <td class="text-dark fw-medium px-0">62, rue des
                                                                      Nations Unies 22000 SAINT-BRIEUC</td>
                                                            </tr>
                                                            <tr>
                                                                 <td class="px-0">
                                                                      <p
                                                                           class="d-flex mb-0 align-items-center gap-1 fw-semibold text-dark">
                                                                           Language : </p>
                                                                 </td>
                                                                 <td class="text-dark fw-medium px-0">English</td>
                                                            </tr>
                                                            <tr>
                                                                 <td class="px-0">
                                                                      <p
                                                                           class="d-flex mb-0 align-items-center gap-1 fw-semibold text-dark">
                                                                           Latest Invoice Id : </p>
                                                                 </td>
                                                                 <td class="text-dark fw-medium px-0">#INV2540</td>
                                                            </tr>

                                                       </tbody>
                                                  </table>
                                             </div>
                                        </div>
                                   </div>

                                   <div class="card">
                                        <div class="card-header border-bottom border-dashed">
                                             <div class="d-flex align-items-center gap-2">
                                                  <div class="d-block">
                                                       <h4 class="card-title mb-1">Latest Invoice</h4>
                                                       <p class="mb-0 text-muted">Total 234 file, 2.5GB space used</p>
                                                  </div>
                                                  <div class="ms-auto">
                                                       <a href="customer-detail#!"
                                                            class="btn btn-primary btn-sm">View All</a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card-body">
                                             <div class="d-flex p-2 rounded align-items-center gap-2 bg-light-subtle">
                                                  <div
                                                       class="avatar bg-primary-subtle d-flex align-items-center justify-content-center rounded-circle">
                                                       <iconify-icon icon="solar:file-download-bold"
                                                            class="text-primary fs-3"><template shadowrootmode="open">
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
                                                            </template></iconify-icon>
                                                  </div>
                                                  <div class="d-block">
                                                       <a href="customer-detail#!"
                                                            class="text-dark fw-medium">Invoice Id #INV2540</a>
                                                       <p class="text-muted mb-0 fs-13">16 May 2024</p>
                                                  </div>
                                                  <div class="ms-auto text-end">
                                                       <div class="dropdown">
                                                            <a href="customer-detail#"
                                                                 class="dropdown-toggle arrow-none card-drop p-0"
                                                                 data-bs-toggle="dropdown" aria-expanded="false">
                                                                 <i class="ti ti-dots-vertical"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Download</a>
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Share</a>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div
                                                  class="d-flex p-2 rounded align-items-center gap-2 bg-light-subtle mt-2">
                                                  <div
                                                       class="avatar bg-primary-subtle d-flex align-items-center justify-content-center rounded-circle">
                                                       <iconify-icon icon="solar:file-download-bold"
                                                            class="text-primary fs-3"><template shadowrootmode="open">
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
                                                            </template></iconify-icon>
                                                  </div>
                                                  <div class="d-block">
                                                       <a href="customer-detail#!"
                                                            class="text-dark fw-medium">Invoice Id #INV0914</a>
                                                       <p class="text-muted mb-0 fs-13">17 Jan 2024</p>
                                                  </div>
                                                  <div class="ms-auto text-end">
                                                       <div class="dropdown">
                                                            <a href="customer-detail#"
                                                                 class="dropdown-toggle arrow-none card-drop p-0"
                                                                 data-bs-toggle="dropdown" aria-expanded="false">
                                                                 <i class="ti ti-dots-vertical"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Download</a>
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Share</a>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div
                                                  class="d-flex p-2 rounded align-items-center gap-2 bg-light-subtle mt-2">
                                                  <div
                                                       class="avatar bg-primary-subtle  d-flex align-items-center justify-content-center rounded-circle">
                                                       <iconify-icon icon="solar:file-download-bold"
                                                            class="text-primary fs-3"><template shadowrootmode="open">
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
                                                            </template></iconify-icon>
                                                  </div>
                                                  <div class="d-block">
                                                       <a href="customer-detail#!"
                                                            class="text-dark fw-medium">Invoice Id #INV3801</a>
                                                       <p class="text-muted mb-0 fs-13">09 Nov 2023</p>
                                                  </div>
                                                  <div class="ms-auto text-end">
                                                       <div class="dropdown">
                                                            <a href="customer-detail#"
                                                                 class="dropdown-toggle arrow-none card-drop p-0"
                                                                 data-bs-toggle="dropdown" aria-expanded="false">
                                                                 <i class="ti ti-dots-vertical"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Download</a>
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Share</a>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div
                                                  class="d-flex p-2 rounded align-items-center gap-2 bg-light-subtle mt-2 mb-1">
                                                  <div
                                                       class="avatar bg-primary-subtle d-flex align-items-center justify-content-center rounded-circle">
                                                       <iconify-icon icon="solar:file-download-bold"
                                                            class="text-primary fs-3"><template shadowrootmode="open">
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
                                                            </template></iconify-icon>
                                                  </div>
                                                  <div class="d-block">
                                                       <a href="customer-detail#!"
                                                            class="text-dark fw-medium">Invoice Id #INV4782</a>
                                                       <p class="text-muted mb-0 fs-13">21 Aug 2023</p>
                                                  </div>
                                                  <div class="ms-auto text-end">
                                                       <div class="dropdown">
                                                            <a href="customer-detail#"
                                                                 class="dropdown-toggle arrow-none card-drop p-0"
                                                                 data-bs-toggle="dropdown" aria-expanded="false">
                                                                 <i class="ti ti-dots-vertical"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Download</a>
                                                                 <a href="javascript:void(0);"
                                                                      class="dropdown-item">Share</a>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-lg-8">
                                   <div class="row">
                                        <div class="col-lg-4">
                                             <div class="card">
                                                  <div class="card-body">
                                                       <div class="d-flex align-items-center justify-content-between">
                                                            <div>
                                                                 <h4
                                                                      class="card-title mb-2 d-flex align-items-center gap-2">
                                                                      Total Invoice</h4>
                                                                 <p class="text-muted fw-medium fs-22 mb-0">234</p>
                                                            </div>
                                                            <div>
                                                                 <div
                                                                      class="avatar-md bg-primary bg-opacity-10 rounded">
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
                                                                                </style><svg
                                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                                     width="1em" height="1em"
                                                                                     viewBox="0 0 24 24">
                                                                                     <path fill="currentColor"
                                                                                          d="M7.245 2h9.51c1.159 0 1.738 0 2.206.163a3.05 3.05 0 0 1 1.881 1.936C21 4.581 21 5.177 21 6.37v14.004c0 .858-.985 1.314-1.608.744a.946.946 0 0 0-1.284 0l-.483.442a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0l-.483-.442a.946.946 0 0 0-1.284 0c-.623.57-1.608.114-1.608-.744V6.37c0-1.193 0-1.79.158-2.27c.3-.913.995-1.629 1.881-1.937C5.507 2 6.086 2 7.245 2"
                                                                                          opacity=".5"></path>
                                                                                     <path fill="currentColor"
                                                                                          d="M7 6.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 10.25a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 13.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5z">
                                                                                     </path>
                                                                                </svg>
                                                                           </template></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="col-lg-4">
                                             <div class="card">
                                                  <div class="card-body">
                                                       <div class="d-flex align-items-center justify-content-between">
                                                            <div>
                                                                 <h4
                                                                      class="card-title mb-2 d-flex align-items-center gap-2">
                                                                      Total Order</h4>
                                                                 <p class="text-muted fw-medium fs-22 mb-0">219</p>
                                                            </div>
                                                            <div>
                                                                 <div
                                                                      class="avatar-md bg-primary bg-opacity-10 rounded">
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
                                                                                </style><svg
                                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                                     width="1em" height="1em"
                                                                                     viewBox="0 0 24 24">
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
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="col-lg-4">
                                             <div class="card">
                                                  <div class="card-body">
                                                       <div class="d-flex align-items-center justify-content-between">
                                                            <div>
                                                                 <h4
                                                                      class="card-title mb-2 d-flex align-items-center gap-2">
                                                                      Total Expense</h4>
                                                                 <p class="text-muted fw-medium fs-22 mb-0">$2,189</p>
                                                            </div>
                                                            <div>
                                                                 <div
                                                                      class="avatar-md bg-primary bg-opacity-10 rounded">
                                                                      <iconify-icon
                                                                           icon="solar:chat-round-money-bold-duotone"
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
                                                                                </style><svg
                                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                                     width="1em" height="1em"
                                                                                     viewBox="0 0 24 24">
                                                                                     <path fill="currentColor"
                                                                                          d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12c0 1.6.376 3.112 1.043 4.453c.178.356.237.763.134 1.148l-.595 2.226a1.3 1.3 0 0 0 1.591 1.592l2.226-.596a1.63 1.63 0 0 1 1.149.133A9.96 9.96 0 0 0 12 22"
                                                                                          opacity=".5"></path>
                                                                                     <path fill="currentColor"
                                                                                          d="M12.75 8a.75.75 0 0 0-1.5 0v.01c-1.089.275-2 1.133-2 2.323c0 1.457 1.365 2.417 2.75 2.417c.824 0 1.25.533 1.25.917s-.426.916-1.25.916s-1.25-.532-1.25-.916a.75.75 0 0 0-1.5 0c0 1.19.911 2.049 2 2.323V16a.75.75 0 0 0 1.5 0v-.01c1.089-.274 2-1.133 2-2.323c0-1.457-1.365-2.417-2.75-2.417c-.824 0-1.25-.533-1.25-.917s.426-.916 1.25-.916s1.25.532 1.25.916a.75.75 0 0 0 1.5 0c0-1.19-.911-2.048-2-2.323z">
                                                                                     </path>
                                                                                </svg>
                                                                           </template></iconify-icon>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>

                                   <div class="card">
                                        <div class="card-header">
                                             <h4 class="card-title">Transaction History</h4>
                                        </div>
                                        <div class="card-body">
                                             <div class="table-responsive">
                                                  <table class="table align-middle mb-0 table-hover table-centered">
                                                       <thead class="bg-light-subtle">
                                                            <tr>
                                                                 <th>Invoice ID</th>
                                                                 <th>Status</th>
                                                                 <th>Total Amount</th>
                                                                 <th>Due Date</th>
                                                                 <th>Payment Method</th>
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                            <tr>
                                                                 <td><a href="javascript: void(0);"
                                                                           class="text-body">#INV2540</a> </td>
                                                                 <td> <span
                                                                           class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                                 </td>
                                                                 <td> $421.00 </td>
                                                                 <td> 07 Jan, 2023</td>
                                                                 <td> Mastercard </td>
                                                            </tr>

                                                            <tr>
                                                                 <td><a href="javascript: void(0);"
                                                                           class="text-body">#INV3924</a> </td>
                                                                 <td> <span
                                                                           class="badge bg-danger-subtle text-danger px-2 py-1">Cancel</span>
                                                                 </td>
                                                                 <td> $736.00 </td>
                                                                 <td> 03 Dec, 2023</td>
                                                                 <td> Visa </td>
                                                            </tr>

                                                            <tr>
                                                                 <td><a href="javascript: void(0);"
                                                                           class="text-body">#INV5032</a> </td>
                                                                 <td>
                                                                      <span
                                                                           class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                                 </td>
                                                                 <td> $347.00</td>
                                                                 <td> 28 Sep, 2023 </td>
                                                                 <td> Paypal </td>
                                                            </tr>
                                                            <tr>
                                                                 <td><a href="javascript: void(0);"
                                                                           class="text-body">#INV1695</a> </td>
                                                                 <td><span
                                                                           class="badge bg-primary-subtle text-primary py-1 px-2">Pending</span>
                                                                 </td>
                                                                 <td> $457.00 </td>
                                                                 <td>10 Aug, 2023</td>
                                                                 <td> Mastercard</td>
                                                            </tr>
                                                            <tr>
                                                                 <td><a href="javascript: void(0);"
                                                                           class="text-body">#INV8473</a> </td>
                                                                 <td> <span
                                                                           class="badge bg-success-subtle text-success px-2 py-1 ">Completed</span>
                                                                 </td>
                                                                 <td> $414.00</td>
                                                                 <td> 22 May, 2023 </td>
                                                                 <td> Visa</td>
                                                            </tr>
                                                       </tbody>
                                                  </table>
                                             </div>
                                        </div>
                                        <div class="card-footer border-top">
                                             <ul class="pagination pagination-rounded m-0 justify-content-end">
                                                  <li class="page-item">
                                                       <a href="customer-detail#" class="page-link"><i
                                                                 class="bx bx-left-arrow-alt"></i></a>
                                                  </li>
                                                  <li class="page-item active">
                                                       <a href="customer-detail#" class="page-link">1</a>
                                                  </li>
                                                  <li class="page-item">
                                                       <a href="customer-detail#" class="page-link">2</a>
                                                  </li>
                                                  <li class="page-item">
                                                       <a href="customer-detail#" class="page-link">3</a>
                                                  </li>
                                                  <li class="page-item">
                                                       <a href="customer-detail#" class="page-link"><i
                                                                 class="bx bx-right-arrow-alt"></i></a>
                                                  </li>
                                             </ul>
                                        </div>
                                   </div>
                                   <div class="row">
                                        <div class="col-lg-6">
                                             <div class="card">
                                                  <div class="card-body text-center">
                                                       <img src="../webPage/admin/assets/images/user-profile.png" alt="" class="img-fluid">
                                                       <h4><i class="bx bxs-coin-stack text-primary"></i> 3,764 <span
                                                                 class="text-muted fw-medium">Points Earned</span> </h4>
                                                       <p class="mb-0">Collect reward points with each purchase.</p>
                                                  </div>
                                                  <div class="card-footer border-top gap-1 hstack">
                                                       <a href="customer-detail#!"
                                                            class="btn btn-primary w-100">Earn Point</a>
                                                       <a href="customer-detail#!" class="btn btn-light w-100">View
                                                            Items</a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="col-lg-6">
                                             <div class="card">
                                                  <div class="card-body">
                                                       <div class="d-flex gap-3">
                                                            <div
                                                                 class="avatar bg-light d-flex align-items-center justify-content-center rounded-circle">
                                                                 <i class="bx bx-down-arrow-alt fs-30"></i>
                                                            </div>
                                                            <div class="d-block">
                                                                 <h4 class="text-dark fw-medium mb-1">Payment Arrived
                                                                 </h4>
                                                                 <p class="mb-0 text-muted">23 min ago</p>
                                                            </div>
                                                            <div class="ms-auto">
                                                                 <h4 class="text-dark fw-medium mb-1">$ 1,340</h4>
                                                            </div>
                                                       </div>
                                                  </div>
                                             </div>
                                             <div class="card">
                                                  <div class="card-body">
                                                       <div class="d-flex align-items-center gap-2">

                                                            <img src="../webPage/admin/assets/images/users/avatar-2.jpg" alt="avatar-3"
                                                                 class="avatar rounded-circle">

                                                            <div class="d-block">
                                                                 <h4 class="text-dark fw-medium mb-1">Michael A. Miner
                                                                 </h4>
                                                                 <p class="mb-0 text-muted">Welcome Back</p>
                                                            </div>
                                                            <div class="ms-auto">
                                                                 <span class="text-muted">
                                                                      <a href="customer-detail#!"
                                                                           class="link-reset fs-3"><iconify-icon
                                                                                icon="solar:settings-bold"><template
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
                                                                 </span>
                                                            </div>
                                                       </div>
                                                       <div class="mt-4">
                                                            <div class="d-flex align-items-center">
                                                                 <h5 class="text-dark mb-0">All Account <span
                                                                           class="text-muted fw-normal ms-1"><i
                                                                                class="bx bxs-circle fs-10"></i></span><span
                                                                           class="text-muted fw-normal ms-1">Total
                                                                           Balance</span></h5>
                                                                 <div class="ms-auto">
                                                                      <a href="customer-detail#!"
                                                                           class="link-reset fw-medium">UTS <i
                                                                                class="bx bx-down-arrow-alt text-danger"></i></a>
                                                                 </div>
                                                            </div>
                                                            <h3 class="fw-semibold mt-2 mb-0">$4,700 <span
                                                                      class="fs-5 text-muted ms-1">+$232</span></h3>
                                                            <div id="chart2" class="apex-charts mt-3"
                                                                 style="min-height: 208px;">
                                                                 <div id="apexcharts83275okdh"
                                                                      class="apexcharts-canvas apexcharts83275okdh apexcharts-theme-light"
                                                                      style="width: 321px; height: 208px;"><svg
                                                                           id="SvgjsSvg1001" width="321" height="208"
                                                                           xmlns="http://www.w3.org/2000/svg"
                                                                           version="1.1"
                                                                           xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                           xmlns:svgjs="http://svgjs.dev"
                                                                           class="apexcharts-svg"
                                                                           xmlns:data="ApexChartsNS"
                                                                           transform="translate(0, 0)"
                                                                           style="background: transparent;">
                                                                           <foreignobject x="0" y="0" width="321"
                                                                                height="208">
                                                                                <div class="apexcharts-legend"
                                                                                     xmlns="http://www.w3.org/1999/xhtml"
                                                                                     style="max-height: 104px;"></div>
                                                                           </foreignobject>
                                                                           <rect id="SvgjsRect1005" width="0" height="0"
                                                                                x="0" y="0" rx="0" ry="0" opacity="1"
                                                                                stroke-width="0" stroke="none"
                                                                                stroke-dasharray="0" fill="#fefefe">
                                                                           </rect>
                                                                           <g id="SvgjsG1044" class="apexcharts-yaxis"
                                                                                rel="0" transform="translate(-18, 0)">
                                                                           </g>
                                                                           <g id="SvgjsG1003"
                                                                                class="apexcharts-inner apexcharts-graphical"
                                                                                transform="translate(0, 1)">
                                                                                <defs id="SvgjsDefs1002">
                                                                                     <clippath
                                                                                          id="gridRectMask83275okdh">
                                                                                          <rect id="SvgjsRect1007"
                                                                                               width="327" height="212"
                                                                                               x="-3" y="-3" rx="0"
                                                                                               ry="0" opacity="1"
                                                                                               stroke-width="0"
                                                                                               stroke="none"
                                                                                               stroke-dasharray="0"
                                                                                               fill="#fff"></rect>
                                                                                     </clippath>
                                                                                     <clippath
                                                                                          id="forecastMask83275okdh">
                                                                                     </clippath>
                                                                                     <clippath
                                                                                          id="nonForecastMask83275okdh">
                                                                                     </clippath>
                                                                                     <clippath
                                                                                          id="gridRectMarkerMask83275okdh">
                                                                                          <rect id="SvgjsRect1008"
                                                                                               width="325" height="210"
                                                                                               x="-2" y="-2" rx="0"
                                                                                               ry="0" opacity="1"
                                                                                               stroke-width="0"
                                                                                               stroke="none"
                                                                                               stroke-dasharray="0"
                                                                                               fill="#fff"></rect>
                                                                                     </clippath>
                                                                                     <lineargradient
                                                                                          id="SvgjsLinearGradient1013"
                                                                                          x1="0" y1="0" x2="0" y2="1">
                                                                                          <stop id="SvgjsStop1014"
                                                                                               stop-opacity="0.4"
                                                                                               stop-color="rgba(255,108,47,0.4)"
                                                                                               offset="0"></stop>
                                                                                          <stop id="SvgjsStop1015"
                                                                                               stop-opacity="0"
                                                                                               stop-color="rgba(255,182,151,0)"
                                                                                               offset="1"></stop>
                                                                                          <stop id="SvgjsStop1016"
                                                                                               stop-opacity="0"
                                                                                               stop-color="rgba(255,182,151,0)"
                                                                                               offset="1"></stop>
                                                                                     </lineargradient>
                                                                                </defs>
                                                                                <line id="SvgjsLine1006" x1="224.2"
                                                                                     y1="0" x2="224.2" y2="206"
                                                                                     stroke="#b6b6b6"
                                                                                     stroke-dasharray="3"
                                                                                     stroke-linecap="butt"
                                                                                     class="apexcharts-xcrosshairs"
                                                                                     x="224.2" y="0" width="1"
                                                                                     height="206" fill="#b1b9c4"
                                                                                     filter="none" fill-opacity="0.9"
                                                                                     stroke-width="1"></line>
                                                                                <g id="SvgjsG1019"
                                                                                     class="apexcharts-grid">
                                                                                     <g id="SvgjsG1020"
                                                                                          class="apexcharts-gridlines-horizontal"
                                                                                          style="display: none;">
                                                                                          <line id="SvgjsLine1023"
                                                                                               x1="0" y1="0" x2="321"
                                                                                               y2="0" stroke="#e0e0e0"
                                                                                               stroke-dasharray="0"
                                                                                               stroke-linecap="butt"
                                                                                               class="apexcharts-gridline">
                                                                                          </line>
                                                                                          <line id="SvgjsLine1024"
                                                                                               x1="0"
                                                                                               y1="68.66666666666667"
                                                                                               x2="321"
                                                                                               y2="68.66666666666667"
                                                                                               stroke="#e0e0e0"
                                                                                               stroke-dasharray="0"
                                                                                               stroke-linecap="butt"
                                                                                               class="apexcharts-gridline">
                                                                                          </line>
                                                                                          <line id="SvgjsLine1025"
                                                                                               x1="0"
                                                                                               y1="137.33333333333334"
                                                                                               x2="321"
                                                                                               y2="137.33333333333334"
                                                                                               stroke="#e0e0e0"
                                                                                               stroke-dasharray="0"
                                                                                               stroke-linecap="butt"
                                                                                               class="apexcharts-gridline">
                                                                                          </line>
                                                                                          <line id="SvgjsLine1026"
                                                                                               x1="0" y1="206" x2="321"
                                                                                               y2="206" stroke="#e0e0e0"
                                                                                               stroke-dasharray="0"
                                                                                               stroke-linecap="butt"
                                                                                               class="apexcharts-gridline">
                                                                                          </line>
                                                                                     </g>
                                                                                     <g id="SvgjsG1021"
                                                                                          class="apexcharts-gridlines-vertical"
                                                                                          style="display: none;"></g>
                                                                                     <line id="SvgjsLine1028" x1="0"
                                                                                          y1="206" x2="321" y2="206"
                                                                                          stroke="transparent"
                                                                                          stroke-dasharray="0"
                                                                                          stroke-linecap="butt"></line>
                                                                                     <line id="SvgjsLine1027" x1="0"
                                                                                          y1="1" x2="0" y2="206"
                                                                                          stroke="transparent"
                                                                                          stroke-dasharray="0"
                                                                                          stroke-linecap="butt"></line>
                                                                                </g>
                                                                                <g id="SvgjsG1022"
                                                                                     class="apexcharts-grid-borders"
                                                                                     style="display: none;"></g>
                                                                                <g id="SvgjsG1009"
                                                                                     class="apexcharts-area-series apexcharts-plot-series">
                                                                                     <g id="SvgjsG1010"
                                                                                          class="apexcharts-series"
                                                                                          zIndex="0"
                                                                                          seriesName="series-1"
                                                                                          data:longestSeries="true"
                                                                                          rel="1" data:realIndex="0">
                                                                                          <path id="SvgjsPath1017"
                                                                                               d="M0 206L0 148.77777777777777C11.235 148.77777777777777 20.865000000000002 54.93333333333334 32.1 54.93333333333334C43.335 54.93333333333334 52.965 112.15555555555555 64.2 112.15555555555555C75.435 112.15555555555555 85.065 2.288888888888863 96.3 2.288888888888863C107.535 2.288888888888863 117.165 61.79999999999998 128.4 61.79999999999998C139.635 61.79999999999998 149.26500000000001 148.77777777777777 160.5 148.77777777777777C171.73499999999999 148.77777777777777 181.365 105.28888888888888 192.6 105.28888888888888C203.83499999999998 105.28888888888888 213.465 178.53333333333333 224.7 178.53333333333333C235.935 178.53333333333333 245.565 123.6 256.8 123.6C268.035 123.6 277.66499999999996 185.4 288.9 185.4C300.135 185.4 309.765 82.39999999999999 321 82.39999999999999C321 82.39999999999999 321 82.39999999999999 321 206M321 82.39999999999999C321 82.39999999999999 321 82.39999999999999 321 82.39999999999999 "
                                                                                               fill="url(#SvgjsLinearGradient1013)"
                                                                                               fill-opacity="1"
                                                                                               stroke-opacity="1"
                                                                                               stroke-linecap="butt"
                                                                                               stroke-width="0"
                                                                                               stroke-dasharray="0"
                                                                                               class="apexcharts-area"
                                                                                               index="0"
                                                                                               clip-path="url(#gridRectMask83275okdh)"
                                                                                               pathTo="M 0 206 L 0 148.77777777777777C 11.235 148.77777777777777 20.865000000000002 54.93333333333334 32.1 54.93333333333334C 43.335 54.93333333333334 52.965 112.15555555555555 64.2 112.15555555555555C 75.435 112.15555555555555 85.065 2.288888888888863 96.3 2.288888888888863C 107.535 2.288888888888863 117.165 61.79999999999998 128.4 61.79999999999998C 139.635 61.79999999999998 149.26500000000001 148.77777777777777 160.5 148.77777777777777C 171.73499999999999 148.77777777777777 181.365 105.28888888888888 192.6 105.28888888888888C 203.83499999999998 105.28888888888888 213.465 178.53333333333333 224.7 178.53333333333333C 235.935 178.53333333333333 245.565 123.6 256.8 123.6C 268.035 123.6 277.66499999999996 185.4 288.9 185.4C 300.135 185.4 309.765 82.39999999999999 321 82.39999999999999C 321 82.39999999999999 321 82.39999999999999 321 206M 321 82.39999999999999z"
                                                                                               pathFrom="M -1 206 L -1 206 L 32.1 206 L 64.2 206 L 96.3 206 L 128.4 206 L 160.5 206 L 192.6 206 L 224.7 206 L 256.8 206 L 288.9 206 L 321 206">
                                                                                          </path>
                                                                                          <path id="SvgjsPath1018"
                                                                                               d="M0 148.77777777777777C11.235 148.77777777777777 20.865000000000002 54.93333333333334 32.1 54.93333333333334C43.335 54.93333333333334 52.965 112.15555555555555 64.2 112.15555555555555C75.435 112.15555555555555 85.065 2.288888888888863 96.3 2.288888888888863C107.535 2.288888888888863 117.165 61.79999999999998 128.4 61.79999999999998C139.635 61.79999999999998 149.26500000000001 148.77777777777777 160.5 148.77777777777777C171.73499999999999 148.77777777777777 181.365 105.28888888888888 192.6 105.28888888888888C203.83499999999998 105.28888888888888 213.465 178.53333333333333 224.7 178.53333333333333C235.935 178.53333333333333 245.565 123.6 256.8 123.6C268.035 123.6 277.66499999999996 185.4 288.9 185.4C300.135 185.4 309.765 82.39999999999999 321 82.39999999999999C321 82.39999999999999 321 82.39999999999999 321 82.39999999999999 "
                                                                                               fill="none"
                                                                                               fill-opacity="1"
                                                                                               stroke="#ff6c2f"
                                                                                               stroke-opacity="1"
                                                                                               stroke-linecap="butt"
                                                                                               stroke-width="2"
                                                                                               stroke-dasharray="0"
                                                                                               class="apexcharts-area"
                                                                                               index="0"
                                                                                               clip-path="url(#gridRectMask83275okdh)"
                                                                                               pathTo="M 0 148.77777777777777C 11.235 148.77777777777777 20.865000000000002 54.93333333333334 32.1 54.93333333333334C 43.335 54.93333333333334 52.965 112.15555555555555 64.2 112.15555555555555C 75.435 112.15555555555555 85.065 2.288888888888863 96.3 2.288888888888863C 107.535 2.288888888888863 117.165 61.79999999999998 128.4 61.79999999999998C 139.635 61.79999999999998 149.26500000000001 148.77777777777777 160.5 148.77777777777777C 171.73499999999999 148.77777777777777 181.365 105.28888888888888 192.6 105.28888888888888C 203.83499999999998 105.28888888888888 213.465 178.53333333333333 224.7 178.53333333333333C 235.935 178.53333333333333 245.565 123.6 256.8 123.6C 268.035 123.6 277.66499999999996 185.4 288.9 185.4C 300.135 185.4 309.765 82.39999999999999 321 82.39999999999999"
                                                                                               pathFrom="M -1 206 L -1 206 L 32.1 206 L 64.2 206 L 96.3 206 L 128.4 206 L 160.5 206 L 192.6 206 L 224.7 206 L 256.8 206 L 288.9 206 L 321 206"
                                                                                               fill-rule="evenodd">
                                                                                          </path>
                                                                                          <g id="SvgjsG1011"
                                                                                               class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
                                                                                               data:realIndex="0">
                                                                                               <g
                                                                                                    class="apexcharts-series-markers">
                                                                                                    <circle
                                                                                                         id="SvgjsCircle1048"
                                                                                                         r="0"
                                                                                                         cx="224.7"
                                                                                                         cy="178.53333333333333"
                                                                                                         class="apexcharts-marker wzdwwrilz no-pointer-events"
                                                                                                         stroke="#ffffff"
                                                                                                         fill="#ff6c2f"
                                                                                                         fill-opacity="1"
                                                                                                         stroke-width="2"
                                                                                                         stroke-opacity="0.9"
                                                                                                         default-marker-size="0">
                                                                                                    </circle>
                                                                                               </g>
                                                                                          </g>
                                                                                     </g>
                                                                                     <g id="SvgjsG1012"
                                                                                          class="apexcharts-datalabels"
                                                                                          data:realIndex="0"></g>
                                                                                </g>
                                                                                <line id="SvgjsLine1029" x1="0" y1="0"
                                                                                     x2="321" y2="0" stroke="#b6b6b6"
                                                                                     stroke-dasharray="0"
                                                                                     stroke-width="1"
                                                                                     stroke-linecap="butt"
                                                                                     class="apexcharts-ycrosshairs">
                                                                                </line>
                                                                                <line id="SvgjsLine1030" x1="0" y1="0"
                                                                                     x2="321" y2="0"
                                                                                     stroke-dasharray="0"
                                                                                     stroke-width="0"
                                                                                     stroke-linecap="butt"
                                                                                     class="apexcharts-ycrosshairs-hidden">
                                                                                </line>
                                                                                <g id="SvgjsG1031"
                                                                                     class="apexcharts-xaxis"
                                                                                     transform="translate(0, 0)">
                                                                                     <g id="SvgjsG1032"
                                                                                          class="apexcharts-xaxis-texts-g"
                                                                                          transform="translate(0, -4)">
                                                                                     </g>
                                                                                </g>
                                                                                <g id="SvgjsG1045"
                                                                                     class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown">
                                                                                </g>
                                                                                <g id="SvgjsG1046"
                                                                                     class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown">
                                                                                </g>
                                                                                <g id="SvgjsG1047"
                                                                                     class="apexcharts-point-annotations apexcharts-hidden-element-shown">
                                                                                </g>
                                                                           </g>
                                                                      </svg>
                                                                      <div class="apexcharts-tooltip apexcharts-theme-light"
                                                                           style="left: 179.175px; top: 181.533px;">
                                                                           <div class="apexcharts-tooltip-series-group apexcharts-active"
                                                                                style="order: 1; display: flex;"><span
                                                                                     class="apexcharts-tooltip-marker"
                                                                                     style="background-color: rgb(255, 108, 47); display: none;"></span>
                                                                                <div class="apexcharts-tooltip-text"
                                                                                     style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                                                     <div
                                                                                          class="apexcharts-tooltip-y-group">
                                                                                          <span
                                                                                               class="apexcharts-tooltip-text-y-label"></span><span
                                                                                               class="apexcharts-tooltip-text-y-value">12</span>
                                                                                     </div>
                                                                                     <div
                                                                                          class="apexcharts-tooltip-goals-group">
                                                                                          <span
                                                                                               class="apexcharts-tooltip-text-goals-label"></span><span
                                                                                               class="apexcharts-tooltip-text-goals-value"></span>
                                                                                     </div>
                                                                                     <div
                                                                                          class="apexcharts-tooltip-z-group">
                                                                                          <span
                                                                                               class="apexcharts-tooltip-text-z-label"></span><span
                                                                                               class="apexcharts-tooltip-text-z-value"></span>
                                                                                     </div>
                                                                                </div>
                                                                           </div>
                                                                      </div>
                                                                      <div
                                                                           class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
                                                                           <div class="apexcharts-yaxistooltip-text">
                                                                           </div>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                                  <div class="card-footer border-top gap-1 hstack">
                                                       <a href="customer-detail#!"
                                                            class="btn btn-primary w-100">Send</a>
                                                       <a href="customer-detail#!"
                                                            class="btn btn-light w-100">Receive</a>
                                                       <a href="customer-detail#!"
                                                            class="btn btn-soft-dark d-inline-flex align-items-center justify-content-center rounded avatar-sm"><i
                                                                 class="bx bx-plus fs-18"></i></a>
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

     </div>
     <!-- END Wrapper -->

     <script src="../webPage/admin/assets/js/vendor.js"></script>

     <!-- App Javascript (Require in all Page) -->
     <script src="../webPage/admin/assets/js/app.js"></script>

     <script src="../webPage/admin/assets/js/pages/customer-details.js"></script>


     <svg id="SvgjsSvg1049" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
          xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
          style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
          <defs id="SvgjsDefs1050"></defs>
          <polyline id="SvgjsPolyline1051" points="0,0"></polyline>
          <path id="SvgjsPath1052"
               d="M-1 206L-1 206C-1 206 32.1 206 32.1 206C32.1 206 64.2 206 64.2 206C64.2 206 96.3 206 96.3 206C96.3 206 128.4 206 128.4 206C128.4 206 160.5 206 160.5 206C160.5 206 192.6 206 192.6 206C192.6 206 224.7 206 224.7 206C224.7 206 256.8 206 256.8 206C256.8 206 288.9 206 288.9 206C288.9 206 321 206 321 206C321 206 321 206 321 206 ">
          </path>
     </svg>

</body>

</html>