<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <!-- Title Meta -->
     <meta charset="utf-8" />
     <title>Product List | Larkon - Responsive Admin Dashboard Template</title>
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
     
     <style type="text/css" data-href="lib\style.css">.star-rating {
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
        <style id="apexcharts-css">@keyframes opaque {
          0% {
              opacity: 0
          }
        
          to {
              opacity: 1
          }
        }
        
        @keyframes resizeanim {
          0%,to {
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
          background-color: rgba(0,0,0,.5);
          box-shadow: 0 0 1px rgba(255,255,255,.5);
          -webkit-box-shadow: 0 0 1px rgba(255,255,255,.5)
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
          background: rgba(255,255,255,.96)
        }
        
        .apexcharts-tooltip.apexcharts-theme-dark {
          color: #fff;
          background: rgba(30,30,30,.8)
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
          background: rgba(0,0,0,.7);
          border-bottom: 1px solid #333
        }
        
        .apexcharts-tooltip-text-goals-value,.apexcharts-tooltip-text-y-value,.apexcharts-tooltip-text-z-value {
          display: inline-block;
          margin-left: 5px;
          font-weight: 600
        }
        
        .apexcharts-tooltip-text-goals-label:empty,.apexcharts-tooltip-text-goals-value:empty,.apexcharts-tooltip-text-y-label:empty,.apexcharts-tooltip-text-y-value:empty,.apexcharts-tooltip-text-z-value:empty,.apexcharts-tooltip-title:empty {
          display: none
        }
        
        .apexcharts-tooltip-text-goals-label,.apexcharts-tooltip-text-goals-value {
          padding: 6px 0 5px
        }
        
        .apexcharts-tooltip-goals-group,.apexcharts-tooltip-text-goals-label,.apexcharts-tooltip-text-goals-value {
          display: flex
        }
        
        .apexcharts-tooltip-text-goals-label:not(:empty),.apexcharts-tooltip-text-goals-value:not(:empty) {
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
        
        .apexcharts-tooltip-series-group.apexcharts-active,.apexcharts-tooltip-series-group:last-child {
          padding-bottom: 4px
        }
        
        .apexcharts-tooltip-series-group-hidden {
          opacity: 0;
          height: 0;
          line-height: 0;
          padding: 0!important
        }
        
        .apexcharts-tooltip-y-group {
          padding: 6px 0 5px
        }
        
        .apexcharts-custom-tooltip,.apexcharts-tooltip-box {
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
        
        .apexcharts-xaxistooltip,.apexcharts-yaxistooltip {
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
          background: rgba(0,0,0,.7);
          border: 1px solid rgba(0,0,0,.5);
          color: #fff
        }
        
        .apexcharts-xaxistooltip:after,.apexcharts-xaxistooltip:before {
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
        
        .apexcharts-xaxistooltip-bottom:after,.apexcharts-xaxistooltip-bottom:before {
          bottom: 100%
        }
        
        .apexcharts-xaxistooltip-top:after,.apexcharts-xaxistooltip-top:before {
          top: 100%
        }
        
        .apexcharts-xaxistooltip-bottom:after {
          border-bottom-color: #eceff1
        }
        
        .apexcharts-xaxistooltip-bottom:before {
          border-bottom-color: #90a4ae
        }
        
        .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:after,.apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:before {
          border-bottom-color: rgba(0,0,0,.5)
        }
        
        .apexcharts-xaxistooltip-top:after {
          border-top-color: #eceff1
        }
        
        .apexcharts-xaxistooltip-top:before {
          border-top-color: #90a4ae
        }
        
        .apexcharts-xaxistooltip-top.apexcharts-theme-dark:after,.apexcharts-xaxistooltip-top.apexcharts-theme-dark:before {
          border-top-color: rgba(0,0,0,.5)
        }
        
        .apexcharts-xaxistooltip.apexcharts-active {
          opacity: 1;
          transition: .15s ease all
        }
        
        .apexcharts-yaxistooltip {
          padding: 4px 10px
        }
        
        .apexcharts-yaxistooltip.apexcharts-theme-dark {
          background: rgba(0,0,0,.7);
          border: 1px solid rgba(0,0,0,.5);
          color: #fff
        }
        
        .apexcharts-yaxistooltip:after,.apexcharts-yaxistooltip:before {
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
        
        .apexcharts-yaxistooltip-left:after,.apexcharts-yaxistooltip-left:before {
          left: 100%
        }
        
        .apexcharts-yaxistooltip-right:after,.apexcharts-yaxistooltip-right:before {
          right: 100%
        }
        
        .apexcharts-yaxistooltip-left:after {
          border-left-color: #eceff1
        }
        
        .apexcharts-yaxistooltip-left:before {
          border-left-color: #90a4ae
        }
        
        .apexcharts-yaxistooltip-left.apexcharts-theme-dark:after,.apexcharts-yaxistooltip-left.apexcharts-theme-dark:before {
          border-left-color: rgba(0,0,0,.5)
        }
        
        .apexcharts-yaxistooltip-right:after {
          border-right-color: #eceff1
        }
        
        .apexcharts-yaxistooltip-right:before {
          border-right-color: #90a4ae
        }
        
        .apexcharts-yaxistooltip-right.apexcharts-theme-dark:after,.apexcharts-yaxistooltip-right.apexcharts-theme-dark:before {
          border-right-color: rgba(0,0,0,.5)
        }
        
        .apexcharts-yaxistooltip.apexcharts-active {
          opacity: 1
        }
        
        .apexcharts-yaxistooltip-hidden {
          display: none
        }
        
        .apexcharts-xcrosshairs,.apexcharts-ycrosshairs {
          pointer-events: none;
          opacity: 0;
          transition: .15s ease all
        }
        
        .apexcharts-xcrosshairs.apexcharts-active,.apexcharts-ycrosshairs.apexcharts-active {
          opacity: 1;
          transition: .15s ease all
        }
        
        .apexcharts-ycrosshairs-hidden {
          opacity: 0
        }
        
        .apexcharts-selection-rect {
          cursor: move
        }
        
        .svg_select_boundingRect,.svg_select_points_rot {
          pointer-events: none;
          opacity: 0;
          visibility: hidden
        }
        
        .apexcharts-selection-rect+g .svg_select_boundingRect,.apexcharts-selection-rect+g .svg_select_points_rot {
          opacity: 0;
          visibility: hidden
        }
        
        .apexcharts-selection-rect+g .svg_select_points_l,.apexcharts-selection-rect+g .svg_select_points_r {
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
        
        .apexcharts-menu-icon,.apexcharts-pan-icon,.apexcharts-reset-icon,.apexcharts-selection-icon,.apexcharts-toolbar-custom-icon,.apexcharts-zoom-icon,.apexcharts-zoomin-icon,.apexcharts-zoomout-icon {
          cursor: pointer;
          width: 20px;
          height: 20px;
          line-height: 24px;
          color: #6e8192;
          text-align: center
        }
        
        .apexcharts-menu-icon svg,.apexcharts-reset-icon svg,.apexcharts-zoom-icon svg,.apexcharts-zoomin-icon svg,.apexcharts-zoomout-icon svg {
          fill: #6e8192
        }
        
        .apexcharts-selection-icon svg {
          fill: #444;
          transform: scale(.76)
        }
        
        .apexcharts-theme-dark .apexcharts-menu-icon svg,.apexcharts-theme-dark .apexcharts-pan-icon svg,.apexcharts-theme-dark .apexcharts-reset-icon svg,.apexcharts-theme-dark .apexcharts-selection-icon svg,.apexcharts-theme-dark .apexcharts-toolbar-custom-icon svg,.apexcharts-theme-dark .apexcharts-zoom-icon svg,.apexcharts-theme-dark .apexcharts-zoomin-icon svg,.apexcharts-theme-dark .apexcharts-zoomout-icon svg {
          fill: #f3f4f5
        }
        
        .apexcharts-canvas .apexcharts-reset-zoom-icon.apexcharts-selected svg,.apexcharts-canvas .apexcharts-selection-icon.apexcharts-selected svg,.apexcharts-canvas .apexcharts-zoom-icon.apexcharts-selected svg {
          fill: #008ffb
        }
        
        .apexcharts-theme-light .apexcharts-menu-icon:hover svg,.apexcharts-theme-light .apexcharts-reset-icon:hover svg,.apexcharts-theme-light .apexcharts-selection-icon:not(.apexcharts-selected):hover svg,.apexcharts-theme-light .apexcharts-zoom-icon:not(.apexcharts-selected):hover svg,.apexcharts-theme-light .apexcharts-zoomin-icon:hover svg,.apexcharts-theme-light .apexcharts-zoomout-icon:hover svg {
          fill: #333
        }
        
        .apexcharts-menu-icon,.apexcharts-selection-icon {
          position: relative
        }
        
        .apexcharts-reset-icon {
          margin-left: 5px
        }
        
        .apexcharts-menu-icon,.apexcharts-reset-icon,.apexcharts-zoom-icon {
          transform: scale(.85)
        }
        
        .apexcharts-zoomin-icon,.apexcharts-zoomout-icon {
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
          background: rgba(0,0,0,.7);
          color: #fff
        }
        
        @media screen and (min-width:768px) {
          .apexcharts-canvas:hover .apexcharts-toolbar {
              opacity: 1
          }
        }
        
        .apexcharts-canvas .apexcharts-element-hidden,.apexcharts-datalabel.apexcharts-element-hidden,.apexcharts-hide .apexcharts-series-points {
          opacity: 0
        }
        
        .apexcharts-hidden-element-shown {
          opacity: 1;
          transition: 0.25s ease all;
        }
        .apexcharts-datalabel,.apexcharts-datalabel-label,.apexcharts-datalabel-value,.apexcharts-datalabels,.apexcharts-pie-label {
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
        
        .apexcharts-annotation-rect,.apexcharts-area-series .apexcharts-area,.apexcharts-area-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,.apexcharts-gridline,.apexcharts-line,.apexcharts-line-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,.apexcharts-point-annotation-label,.apexcharts-radar-series path,.apexcharts-radar-series polygon,.apexcharts-toolbar svg,.apexcharts-tooltip .apexcharts-marker,.apexcharts-xaxis-annotation-label,.apexcharts-yaxis-annotation-label,.apexcharts-zoom-rect {
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
        
        .contract-trigger:before,.resize-triggers,.resize-triggers>div {
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
        
        .apexcharts-bar-goals-markers{
          pointer-events: none
        }
        
        .apexcharts-bar-shadows{
          pointer-events: none
        }
        
        .apexcharts-rangebar-goals-markers{
          pointer-events: none
        }</style>
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
               <div class="container-fluid">

                    <div class="row">
                         <div class="col-xl-12">
                              <div class="card">
                                   <div class="card-header d-flex justify-content-between align-items-center gap-1">
                                        <h4 class="card-title flex-grow-1">All Product List</h4>

                                        <a href="product-add" class="btn btn-sm btn-primary">
                                             Add Product
                                        </a>

                                        <div class="dropdown">
                                             <a href="#" class="dropdown-toggle btn btn-sm btn-outline-light" data-bs-toggle="dropdown" aria-expanded="false">
                                                  This Month
                                             </a>
                                             <div class="dropdown-menu dropdown-menu-end">
                                                  <!-- item-->
                                                  <a href="#!" class="dropdown-item">Download</a>
                                                  <!-- item-->
                                                  <a href="#!" class="dropdown-item">Export</a>
                                                  <!-- item-->
                                                  <a href="#!" class="dropdown-item">Import</a>
                                             </div>
                                        </div>
                                   </div>
                                   <div>
                                        <div class="table-responsive">
                                             <table class="table align-middle mb-0 table-hover table-centered">
                                                  <thead class="bg-light-subtle">
                                                       <tr>
                                                            <!-- <th style="width: 20px;">
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck1">
                                                                      <label class="form-check-label" for="customCheck1"></label>
                                                                 </div>
                                                            </th> -->
                                                            <th>Tên sản phẩm</th>
                                                            <th>Giá</th>
                                                            <th>Tồn kho</th>
                                                            <th>Loại</th>
                                                            <th>Đánh giá</th>
                                                            <th>Hành động</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                  <c:forEach var="product" items="${products}">
                                                   
                                                       <tr>
                                                            <!-- <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td> -->
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../getImage?img_id=${product.getImgId()}" alt="${product.title}" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">${product.title}</a>
                                                                           <!-- <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M , L , Xl </p> -->
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>${product.price} VND</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">${product.quantity} sản phẩm</span> sẵn sàng</p>
                                                                 <p class="mb-0 text-muted">0 đã bán</p>
                                                            </td>
                                                            <td> Fashion</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.5</span> 55 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                         <%--  <a href="product-details?productId=${product.productId}"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                                     </template></iconify-icon></a> --%>
                                                                           <a href="product-edit?productId=${product.productId}"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="product-delete?productId=${product.productId}"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
												</c:forEach>
                                                                                   
                                                  </tbody>
                                             </table>
                                        </div>
                                        <!-- end table-responsive -->
                                   </div>
                                   <div class="card-footer border-top">
                                        <nav aria-label="Page navigation example">
                                             <ul class="pagination justify-content-end mb-0">
											    <!-- Previous -->
											    <c:choose>
											        <c:when test="${currentPage > 1}">
											            <li class="page-item">
											                <a class="page-link" href="${pageContext.request.contextPath}/admin/product-list?pageNum=${currentPage - 1}">Previous</a>
											            </li>
											        </c:when>
											        <c:otherwise>
											            <li class="page-item disabled">
											                <a class="page-link" href="#">Previous</a>
											            </li>
											        </c:otherwise>
											    </c:choose>
											
											    <!-- Page Numbers (Hiển thị 5 trang gần nhất) -->
											    <c:set var="startPage" value="${currentPage - 2}" />
											    <c:set var="endPage" value="${currentPage + 2}" />
											
											    <!-- Điều chỉnh startPage và endPage để không vượt quá giới hạn -->
											    <c:if test="${startPage < 1}">
											        <c:set var="startPage" value="1" />
											        <c:set var="endPage" value="${startPage + 4}" />
											    </c:if>
											    <c:if test="${endPage > totalPages}">
											        <c:set var="endPage" value="${totalPages}" />
											        <c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />
											    </c:if>
											    <c:if test="${endPage - startPage + 1 < 5 && totalPages >= 5}">
											        <c:set var="startPage" value="${endPage - 4}" />
											        <c:if test="${startPage < 1}">
											            <c:set var="startPage" value="1" />
											        </c:if>
											    </c:if>
											
											    <!-- Hiển thị dấu "..." nếu không phải trang đầu -->
											    <c:if test="${startPage > 1}">
											        <li class="page-item">
											            <a class="page-link" href="${pageContext.request.contextPath}/admin/product-list?pageNum=1">1</a>
											        </li>
											        <li class="page-item disabled">
											            <span class="page-link">...</span>
											        </li>
											    </c:if>
											
											    <!-- Hiển thị các trang trong khoảng startPage đến endPage -->
											    <c:forEach begin="${startPage}" end="${endPage}" var="i">
											        <c:choose>
											            <c:when test="${i == currentPage}">
											                <li class="page-item active">
											                    <a class="page-link" href="#">${i}</a>
											                </li>
											            </c:when>
											            <c:otherwise>
											                <li class="page-item">
											                    <a class="page-link" href="${pageContext.request.contextPath}/admin/product-list?pageNum=${i}">${i}</a>
											                </li>
											            </c:otherwise>
											        </c:choose>
											    </c:forEach>
											
											    <!-- Hiển thị dấu "..." nếu không phải trang cuối -->
											    <c:if test="${endPage < totalPages}">
											        <li class="page-item disabled">
											            <span class="page-link">...</span>
											        </li>
											        <li class="page-item">
											            <a class="page-link" href="${pageContext.request.contextPath}/admin/product-list?pageNum=${totalPages}">${totalPages}</a>
											        </li>
											    </c:if>
											
											    <!-- Next -->
											    <c:choose>
											        <c:when test="${currentPage < totalPages}">
											            <li class="page-item">
											                <a class="page-link" href="${pageContext.request.contextPath}/admin/product-list?pageNum=${currentPage + 1}">Next</a>
											            </li>
											        </c:when>
											        <c:otherwise>
											            <li class="page-item disabled">
											                <a class="page-link" href="#">Next</a>
											            </li>
											        </c:otherwise>
											    </c:choose>
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

</body>

</html>