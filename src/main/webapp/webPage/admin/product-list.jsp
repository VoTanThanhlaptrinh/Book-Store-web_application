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
          <header class="topbar">
               <div class="container-fluid">
                    <div class="navbar-header">
                         <div class="d-flex align-items-center">
                              <!-- Menu Toggle Button -->
                              <div class="topbar-item">
                                   <button type="button" class="button-toggle-menu me-2">
                                        <iconify-icon icon="solar:hamburger-menu-broken"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
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
                                   </button>
                              </div>

                              <!-- Menu Toggle Button -->
                              <div class="topbar-item">
                                   <h4 class="fw-bold topbar-button pe-none text-uppercase mb-0">Welcome!</h4>
                              </div>
                         </div>

                         <div class="d-flex align-items-center gap-1">

                              <!-- Theme Color (Light/Dark) -->
                              <div class="topbar-item">
                                   <button type="button" class="topbar-button" id="light-dark-mode">
                                        <iconify-icon icon="solar:moon-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
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
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M22 12c0 5.523-4.477 10-10 10a10 10 0 0 1-3.321-.564A9 9 0 0 1 8 18a8.97 8.97 0 0 1 2.138-5.824A6.5 6.5 0 0 0 15.5 15a6.5 6.5 0 0 0 5.567-3.143c.24-.396.933-.32.933.143"
                                                            clip-rule="evenodd" opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M2 12c0 4.359 2.789 8.066 6.679 9.435A9 9 0 0 1 8 18c0-2.221.805-4.254 2.138-5.824A6.47 6.47 0 0 1 9 8.5a6.5 6.5 0 0 1 3.143-5.567C12.54 2.693 12.463 2 12 2C6.477 2 2 6.477 2 12">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- Notification -->
                              <div class="dropdown topbar-item">
                                   <button type="button" class="topbar-button position-relative"
                                        id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <iconify-icon icon="solar:bell-bing-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
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
                                                            d="M18.75 9v.704c0 .845.24 1.671.692 2.374l1.108 1.723c1.011 1.574.239 3.713-1.52 4.21a25.8 25.8 0 0 1-14.06 0c-1.759-.497-2.531-2.636-1.52-4.21l1.108-1.723a4.4 4.4 0 0 0 .693-2.374V9c0-3.866 3.022-7 6.749-7s6.75 3.134 6.75 7"
                                                            opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M12.75 6a.75.75 0 0 0-1.5 0v4a.75.75 0 0 0 1.5 0zM7.243 18.545a5.002 5.002 0 0 0 9.513 0c-3.145.59-6.367.59-9.513 0">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                        <span
                                             class="position-absolute topbar-badge fs-10 translate-middle badge bg-danger rounded-pill">3<span
                                                  class="visually-hidden">unread messages</span></span>
                                   </button>
                                   <div class="dropdown-menu py-0 dropdown-lg dropdown-menu-end"
                                        aria-labelledby="page-header-notifications-dropdown">
                                        <div class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
                                             <div class="row align-items-center">
                                                  <div class="col">
                                                       <h6 class="m-0 fs-16 fw-semibold"> Notifications</h6>
                                                  </div>
                                                  <div class="col-auto">
                                                       <a href="javascript: void(0);"
                                                            class="text-dark text-decoration-underline">
                                                            <small>Clear All</small>
                                                       </a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div data-simplebar="init" style="max-height: 280px;">
                                             <div class="simplebar-wrapper" style="margin: 0px;">
                                                  <div class="simplebar-height-auto-observer-wrapper">
                                                       <div class="simplebar-height-auto-observer"></div>
                                                  </div>
                                                  <div class="simplebar-mask">
                                                       <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                                            <div class="simplebar-content-wrapper" tabindex="0"
                                                                 role="region" aria-label="scrollable content"
                                                                 style="height: auto; overflow: hidden;">
                                                                 <div class="simplebar-content" style="padding: 0px;">
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom text-wrap">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-1.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-1">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0"><span
                                                                                               class="fw-medium">Josephine
                                                                                               Thompson </span>commented
                                                                                          on admin panel <span>" Wow ð!
                                                                                               this admin looks good and
                                                                                               awesome design"</span>
                                                                                     </p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <div class="avatar-sm me-2">
                                                                                          <span
                                                                                               class="avatar-title bg-soft-info text-info fs-20 rounded-circle">
                                                                                               D
                                                                                          </span>
                                                                                     </div>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">
                                                                                          Donoghue Susan</p>
                                                                                     <p class="mb-0 text-wrap">
                                                                                          Hi, How are you? What about
                                                                                          our next meeting
                                                                                     </p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-3.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-3">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">Jacob
                                                                                          Gines</p>
                                                                                     <p class="mb-0 text-wrap">Answered
                                                                                          to your comment on the cash
                                                                                          flow forecast's graph ð.</p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <div class="avatar-sm me-2">
                                                                                          <span
                                                                                               class="avatar-title bg-soft-warning text-warning fs-20 rounded-circle">
                                                                                               <iconify-icon
                                                                                                    icon="iconamoon:comment-dots-duotone"><template
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
                                                                                          </span>
                                                                                     </div>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p
                                                                                          class="mb-0 fw-semibold text-wrap">
                                                                                          You have received <b>20</b>
                                                                                          new messages in the
                                                                                          conversation</p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-5.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-5">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">Shawn
                                                                                          Bunch</p>
                                                                                     <p class="mb-0 text-wrap">
                                                                                          Commented on Admin
                                                                                     </p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                                  <div class="simplebar-placeholder" style="width: 0px; height: 0px;">
                                                  </div>
                                             </div>
                                             <div class="simplebar-track simplebar-horizontal"
                                                  style="visibility: hidden;">
                                                  <div class="simplebar-scrollbar" style="width: 0px; display: none;">
                                                  </div>
                                             </div>
                                             <div class="simplebar-track simplebar-vertical"
                                                  style="visibility: hidden;">
                                                  <div class="simplebar-scrollbar" style="height: 0px; display: none;">
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="text-center py-3">
                                             <a href="javascript:void(0);" class="btn btn-primary btn-sm">View All
                                                  Notification <i class="bx bx-right-arrow-alt ms-1"></i></a>
                                        </div>
                                   </div>
                              </div>

                              <!-- Theme Setting -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn"
                                        data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas"
                                        aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:settings-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
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
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M14.279 2.152C13.909 2 13.439 2 12.5 2s-1.408 0-1.779.152a2 2 0 0 0-1.09 1.083c-.094.223-.13.484-.145.863a1.62 1.62 0 0 1-.796 1.353a1.64 1.64 0 0 1-1.579.008c-.338-.178-.583-.276-.825-.308a2.03 2.03 0 0 0-1.49.396c-.318.242-.553.646-1.022 1.453c-.47.807-.704 1.21-.757 1.605c-.07.526.074 1.058.4 1.479c.148.192.357.353.68.555c.477.297.783.803.783 1.361s-.306 1.064-.782 1.36c-.324.203-.533.364-.682.556a2 2 0 0 0-.399 1.479c.053.394.287.798.757 1.605s.704 1.21 1.022 1.453c.424.323.96.465 1.49.396c.242-.032.487-.13.825-.308a1.64 1.64 0 0 1 1.58.008c.486.28.774.795.795 1.353c.015.38.051.64.145.863c.204.49.596.88 1.09 1.083c.37.152.84.152 1.779.152s1.409 0 1.779-.152a2 2 0 0 0 1.09-1.083c.094-.223.13-.483.145-.863c.02-.558.309-1.074.796-1.353a1.64 1.64 0 0 1 1.579-.008c.338.178.583.276.825.308c.53.07 1.066-.073 1.49-.396c.318-.242.553-.646 1.022-1.453c.47-.807.704-1.21.757-1.605a2 2 0 0 0-.4-1.479c-.148-.192-.357-.353-.68-.555c-.477-.297-.783-.803-.783-1.361s.306-1.064.782-1.36c.324-.203.533-.364.682-.556a2 2 0 0 0 .399-1.479c-.053-.394-.287-.798-.757-1.605s-.704-1.21-1.022-1.453a2.03 2.03 0 0 0-1.49-.396c-.242.032-.487.13-.825.308a1.64 1.64 0 0 1-1.58-.008a1.62 1.62 0 0 1-.795-1.353c-.015-.38-.051-.64-.145-.863a2 2 0 0 0-1.09-1.083"
                                                            clip-rule="evenodd" opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M15.523 12c0 1.657-1.354 3-3.023 3s-3.023-1.343-3.023-3S10.83 9 12.5 9s3.023 1.343 3.023 3">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- Activity -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn"
                                        data-bs-toggle="offcanvas" data-bs-target="#theme-activity-offcanvas"
                                        aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:clock-circle-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
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
                                                            d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10"
                                                            opacity=".5"></path>
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M12 7.25a.75.75 0 0 1 .75.75v3.69l2.28 2.28a.75.75 0 1 1-1.06 1.06l-2.5-2.5a.75.75 0 0 1-.22-.53V8a.75.75 0 0 1 .75-.75"
                                                            clip-rule="evenodd"></path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- User -->
                              <div class="dropdown topbar-item">
                                   <a type="button" class="topbar-button" id="page-header-user-dropdown"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="d-flex align-items-center">
                                             <img class="rounded-circle" width="32"
                                                  src="../webPage/admin/assets/images/users/avatar-1.jpg"
                                                  alt="avatar-3">
                                        </span>
                                   </a>
                                   <div class="dropdown-menu dropdown-menu-end">
                                        <!-- item-->
                                        <h6 class="dropdown-header">Welcome Gaston!</h6>
                                        <a class="dropdown-item"
                                             href="pages-profile.html">
                                             <i class="bx bx-user-circle text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Profile</span>
                                        </a>
                                        <a class="dropdown-item" href="apps-chat.html">
                                             <i class="bx bx-message-dots text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Messages</span>
                                        </a>

                                        <a class="dropdown-item"
                                             href="pages-pricing.html">
                                             <i class="bx bx-wallet text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Pricing</span>
                                        </a>
                                        <a class="dropdown-item" href="pages-faqs.html">
                                             <i class="bx bx-help-circle text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Help</span>
                                        </a>
                                        <a class="dropdown-item"
                                             href="auth-lock-screen.html">
                                             <i class="bx bx-lock text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Lock screen</span>
                                        </a>

                                        <div class="dropdown-divider my-1"></div>

                                        <a class="dropdown-item text-danger"
                                             href="auth-signin.html">
                                             <i class="bx bx-log-out fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Logout</span>
                                        </a>
                                   </div>
                              </div>

                              <!-- App Search-->
                              <form class="app-search d-none d-md-block ms-2">
                                   <div class="position-relative">
                                        <input type="search" class="form-control" placeholder="Search..."
                                             autocomplete="off" value="">
                                        <iconify-icon icon="solar:magnifer-linear" class="search-widget-icon"><template
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
                                                       <g fill="none" stroke="currentColor" stroke-width="1.5">
                                                            <circle cx="11.5" cy="11.5" r="9.5"></circle>
                                                            <path stroke-linecap="round" d="M18.5 18.5L22 22"></path>
                                                       </g>
                                                  </svg>
                                             </template></iconify-icon>
                                   </div>
                              </form>
                         </div>
                    </div>
               </div>
          </header>

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
          <div class="main-nav">
               <!-- Sidebar Logo -->
               <div class="logo-box">
                    <a href="index.html" class="logo-dark">
                         <img src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm" alt="logo sm">
                         <img src="../webPage/admin/assets/images/logo-dark.png" class="logo-lg" alt="logo dark">
                    </a>

                    <a href="index.html" class="logo-light">
                         <img src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm" alt="logo sm">
                         <img src="../webPage/admin/assets/images/logo-light.png" class="logo-lg" alt="logo light">
                    </a>
               </div>

               <!-- Menu Toggle Button (sm-hover) -->
               <button type="button" class="button-sm-hover" aria-label="Show Full Sidebar">
                    <iconify-icon icon="solar:double-alt-arrow-right-bold-duotone"
                         class="button-sm-hover-icon"><template shadowrootmode="open">
                              <style data-style="data-style">
                                   :host {
                                        display: inline-block;
                                        vertical-align: 0
                                   }

                                   span,
                                   svg {
                                        display: block
                                   }
                              </style><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                   viewBox="0 0 24 24">
                                   <path fill="currentColor"
                                        d="M6.25 19a.75.75 0 0 0 1.32.488l6-7a.75.75 0 0 0 0-.976l-6-7A.75.75 0 0 0 6.25 5z"
                                        opacity=".5"></path>
                                   <path fill="currentColor" fill-rule="evenodd"
                                        d="M10.512 19.57a.75.75 0 0 1-.081-1.058L16.012 12l-5.581-6.512a.75.75 0 1 1 1.139-.976l6 7a.75.75 0 0 1 0 .976l-6 7a.75.75 0 0 1-1.058.082"
                                        clip-rule="evenodd"></path>
                              </svg>
                         </template></iconify-icon>
               </button>

               <div class="scrollbar" data-simplebar="init">
                    <div class="simplebar-wrapper" style="margin: 0px;">
                         <div class="simplebar-height-auto-observer-wrapper">
                              <div class="simplebar-height-auto-observer"></div>
                         </div>
                         <div class="simplebar-mask">
                              <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                   <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                        aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                                        <div class="simplebar-content" style="padding: 0px;">
                                             <ul class="navbar-nav" id="navbar-nav">

                                                  <li class="menu-title">General</li>

                                                  <li class="nav-item active">
                                                       <a class="nav-link active" href="index.html">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:widget-5-bold-duotone"><template
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
                                                                                     d="M13 15.4c0-2.074 0-3.111.659-3.756S15.379 11 17.5 11s3.182 0 3.841.644C22 12.29 22 13.326 22 15.4v2.2c0 2.074 0 3.111-.659 3.756S19.621 22 17.5 22s-3.182 0-3.841-.644C13 20.71 13 19.674 13 17.6z"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M2 8.6c0 2.074 0 3.111.659 3.756S4.379 13 6.5 13s3.182 0 3.841-.644C11 11.71 11 10.674 11 8.6V6.4c0-2.074 0-3.111-.659-3.756S8.621 2 6.5 2s-3.182 0-3.841.644C2 3.29 2 4.326 2 6.4zm11-3.1c0-1.087 0-1.63.171-2.06a2.3 2.3 0 0 1 1.218-1.262C14.802 2 15.327 2 16.375 2h2.25c1.048 0 1.573 0 1.986.178c.551.236.99.69 1.218 1.262c.171.43.171.973.171 2.06s0 1.63-.171 2.06a2.3 2.3 0 0 1-1.218 1.262C20.198 9 19.673 9 18.625 9h-2.25c-1.048 0-1.573 0-1.986-.178a2.3 2.3 0 0 1-1.218-1.262C13 7.13 13 6.587 13 5.5">
                                                                                </path>
                                                                                <path fill="currentColor"
                                                                                     d="M2 18.5c0 1.087 0 1.63.171 2.06a2.3 2.3 0 0 0 1.218 1.262c.413.178.938.178 1.986.178h2.25c1.048 0 1.573 0 1.986-.178c.551-.236.99-.69 1.218-1.262c.171-.43.171-.973.171-2.06s0-1.63-.171-2.06a2.3 2.3 0 0 0-1.218-1.262C9.198 15 8.673 15 7.625 15h-2.25c-1.048 0-1.573 0-1.986.178c-.551.236-.99.69-1.218 1.262C2 16.87 2 17.413 2 18.5"
                                                                                     opacity=".5"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Dashboard </span>
                                                       </a>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarProducts"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarProducts">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:t-shirt-bold-duotone"><template
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
                                                                                     fill-rule="evenodd"
                                                                                     d="M5.777 18.265v-7.97c0-.683 0-1.025-.132-1.326c-.131-.3-.378-.523-.871-.968l-.186-.167C3.532 6.882 3.004 6.405 3 5.716c-.004-.69.464-1.122 1.401-1.988q.214-.197.418-.362c.472-.378 1.138-.792 1.648-1.09a2.05 2.05 0 0 1 1.567-.205l.49.129c.389.102.727.353.949.703c.6.948 1.564 1.423 2.527 1.423V22c-1.467 0-2.724-.148-3.716-.33c-1.073-.198-1.61-.296-2.058-.858c-.45-.562-.45-1.224-.45-2.547"
                                                                                     clip-rule="evenodd"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M18.223 18.265v-7.97c0-.683 0-1.025.132-1.326c.131-.3.378-.523.871-.968l.186-.167c1.056-.952 1.584-1.429 1.588-2.118c.004-.69-.465-1.122-1.401-1.988a8 8 0 0 0-.418-.362c-.472-.378-1.138-.792-1.648-1.09a2.05 2.05 0 0 0-1.567-.205l-.49.129a1.6 1.6 0 0 0-.949.703c-.6.948-1.564 1.423-2.527 1.423V22c1.467 0 2.724-.148 3.716-.33c1.073-.198 1.61-.296 2.059-.858c.448-.562.448-1.224.448-2.547"
                                                                                     opacity=".5"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Products </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarProducts">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-grid.html">Grid</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-details.html">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-edit.html">Edit</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-add.html">Create</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>



                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarOrders"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarOrders">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:bag-smile-bold-duotone"><template
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
                                                                                     d="M4.083 11.894c.439-2.34.658-3.511 1.491-4.203C6.408 7 7.598 7 9.98 7h4.04c2.383 0 3.573 0 4.407.691c.833.692 1.052 1.862 1.491 4.203l.75 4c.617 3.292.926 4.938.026 6.022S18.12 23 14.771 23H9.23c-3.349 0-5.024 0-5.923-1.084c-.9-1.084-.591-2.73.026-6.022z"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M9.75 5.985a2.25 2.25 0 0 1 4.5 0v1c.566 0 1.062.002 1.5.015V5.985a3.75 3.75 0 1 0-7.5 0V7c.438-.013.934-.015 1.5-.015zm.128 9.765a2.251 2.251 0 0 0 4.245 0a.75.75 0 1 1 1.414.5a3.751 3.751 0 0 1-7.073 0a.75.75 0 0 1 1.414-.5">
                                                                                </path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Orders </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarOrders">
                                                            <ul class="nav sub-navbar-nav">

                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="orders-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-detail.html">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-cart.html">Cart</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-checkout.html">Check
                                                                           Out</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                
                              


                                                  <li class="menu-title mt-2">Users</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-profile.html">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:chat-square-like-bold-duotone"><template
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
                                                                                     d="m13.629 20.472l-.542.916c-.483.816-1.69.816-2.174 0l-.542-.916c-.42-.71-.63-1.066-.968-1.262c-.338-.197-.763-.204-1.613-.219c-1.256-.021-2.043-.098-2.703-.372a5 5 0 0 1-2.706-2.706C2 14.995 2 13.83 2 11.5v-1c0-3.273 0-4.91.737-6.112a5 5 0 0 1 1.65-1.651C5.59 2 7.228 2 10.5 2h3c3.273 0 4.91 0 6.113.737a5 5 0 0 1 1.65 1.65C22 5.59 22 7.228 22 10.5v1c0 2.33 0 3.495-.38 4.413a5 5 0 0 1-2.707 2.706c-.66.274-1.447.35-2.703.372c-.85.015-1.275.022-1.613.219c-.338.196-.548.551-.968 1.262"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M10.99 14.308c-1.327-.978-3.49-2.84-3.49-4.593c0-2.677 2.475-3.677 4.5-1.609c2.025-2.068 4.5-1.068 4.5 1.609c0 1.752-2.163 3.615-3.49 4.593c-.454.335-.681.502-1.01.502s-.556-.167-1.01-.502">
                                                                                </path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Profile </span>
                                                       </a>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarRoles"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarRoles">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:user-speak-rounded-bold-duotone"><template
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
                                                                                <circle cx="10" cy="6.75" r="4"
                                                                                     fill="currentColor"></circle>
                                                                                <ellipse cx="10" cy="17.75"
                                                                                     fill="currentColor" opacity=".5"
                                                                                     rx="7" ry="4"></ellipse>
                                                                                <path fill="currentColor"
                                                                                     fill-rule="evenodd"
                                                                                     d="M18.357 2.364a.75.75 0 0 1 1.029-.257L19 2.75l.386-.643h.001l.002.002l.004.002l.01.006l.113.076c.07.049.166.12.277.212c.222.185.512.462.802.838c.582.758 1.155 1.914 1.155 3.507s-.573 2.75-1.155 3.507c-.29.376-.58.653-.802.838a4 4 0 0 1-.363.27l-.028.018l-.01.006l-.003.002l-.002.001s-.001.001-.387-.642l.386.643a.75.75 0 0 1-.776-1.283l.005-.004l.041-.027q.06-.042.177-.136c.152-.128.362-.326.573-.6c.417-.542.844-1.386.844-2.593s-.427-2.05-.844-2.593a3.8 3.8 0 0 0-.573-.6a3 3 0 0 0-.218-.163l-.005-.003a.75.75 0 0 1-.253-1.027"
                                                                                     clip-rule="evenodd"></path>
                                                                                <path fill="currentColor"
                                                                                     fill-rule="evenodd"
                                                                                     d="M16.33 4.415a.75.75 0 0 1 1.006-.336L17 4.75l.336-.67h.001l.002.001l.004.002l.008.004l.022.012a2 2 0 0 1 .233.153c.136.102.31.254.48.467c.349.436.664 1.099.664 2.031s-.316 1.595-.664 2.031a2.7 2.7 0 0 1-.654.586l-.06.034l-.02.012l-.01.004l-.003.002l-.002.001l-.33-.657l.329.658a.75.75 0 0 1-.685-1.335l.003-.001l.052-.036c.052-.04.13-.106.209-.205c.15-.189.335-.526.335-1.094s-.184-.905-.335-1.094a1.2 1.2 0 0 0-.261-.24l-.003-.002a.75.75 0 0 1-.322-1"
                                                                                     clip-rule="evenodd"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Roles </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarRoles">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <ul class="nav sub-navbar-nav">
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-list.html">List</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-edit.html">Edit</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-add.html">Create</a>
                                                                      </li>
                                                                 </ul>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarCustomers"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarCustomers">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:users-group-two-rounded-bold-duotone"><template
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
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Customers </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarCustomers">
                                                            <ul class="nav sub-navbar-nav">

                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="customer-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="customer-detail.html">Details</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                  <li class="menu-title mt-2">Other</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarCoupons"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarCoupons">
                                                            <span class="nav-icon">
                                                                 <iconify-icon icon="solar:leaf-bold-duotone"><template
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
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Coupons </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarCoupons">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="coupons-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="coupons-add.html">Add</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-review.html">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:chat-square-like-bold-duotone"><template
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
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Reviews </span>
                                                       </a>
                                                  </li>

                                                  <li class="menu-title mt-2">Other Apps</li>

                                                 

                                                  

                                                  

                         
                                                  <li class="menu-title mt-2">Custom</li>

                                                

                                                  

                                                  

                                                  <li class="menu-title mt-2">Components</li>
                                             </ul>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="simplebar-placeholder" style="width: auto; height: 1738px;"></div>
                    </div>
                    <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                         <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                    </div>
                    <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                         <div class="simplebar-scrollbar"
                              style="height: 187px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
                    </div>
               </div>
          </div>
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

                                        <a href="product-add.html" class="btn btn-sm btn-primary">
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
                                                            <th style="width: 20px;">
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck1">
                                                                      <label class="form-check-label" for="customCheck1"></label>
                                                                 </div>
                                                            </th>
                                                            <th>Product Name & Size</th>
                                                            <th>Price</th>
                                                            <th>Stock</th>
                                                            <th>Category</th>
                                                            <th>Rating</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-1.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Black T-shirt</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M , L , Xl </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$80.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">486 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">155 Sold</p>
                                                            </td>
                                                            <td> Fashion</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.5</span> 55 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-2.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Olive Green Leather Bag</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$136.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">784 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">674 Sold</p>
                                                            </td>
                                                            <td> Hand Bag</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.1</span> 143 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-3.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Women Golden Dress</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$219.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">769 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">180 Sold</p>
                                                            </td>
                                                            <td> Fashion</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.4</span> 174 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-4.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Gray Cap For Men</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M , L</p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$76.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">571 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">87 Sold</p>
                                                            </td>
                                                            <td> Cap</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.2</span> 23 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>


                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-5.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Dark Green Cargo Pent</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M , L , Xl </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$110.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">241 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">342 Sold</p>
                                                            </td>
                                                            <td> Fashion</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.4</span> 109 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>


                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-6.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Orange Multi Color Headphone</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$231.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">821 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">231 Sold</p>
                                                            </td>
                                                            <td> Electronics</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.2</span> 200 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>


                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-7.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Kid's Yellow Shoes</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>18 , 19 , 20 , 21</p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$89.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">321 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">681 Sold</p>
                                                            </td>
                                                            <td> Shoes</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.5</span> 321 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-8.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Men Dark Brown Wallet</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M</p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$132.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">190 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">212 Sold</p>
                                                            </td>
                                                            <td> Wallet</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.1</span> 190 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-9.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Sky Blue Sunglass</a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$77.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">784 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">443 Sold</p>
                                                            </td>
                                                            <td> Sunglass</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 3.5</span> 298 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
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
                                                            <td>$110.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">650 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">365 Sold</p>
                                                            </td>
                                                            <td> Fashion</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.1</span> 156 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-11.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">White Rubber Band Smart Watch </a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>S , M </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$77.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">98 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">241 Sold</p>
                                                            </td>
                                                            <td> Electronics</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 3.4</span> 201 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check ms-1">
                                                                      <input type="checkbox" class="form-check-input" id="customCheck2">
                                                                      <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td>
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <div class="rounded bg-light avatar-md d-flex align-items-center justify-content-center">
                                                                           <img src="../webPage/admin/assets/images/product/p-12.png" alt="" class="avatar-md">
                                                                      </div>
                                                                      <div>
                                                                           <a href="#!" class="text-dark fw-medium fs-15">Men Brown Leather Shoes </a>
                                                                           <p class="text-muted mb-0 mt-1 fs-13"><span>Size : </span>40 , 41 , 42 , 43 </p>
                                                                      </div>
                                                                 </div>

                                                            </td>
                                                            <td>$222.00</td>
                                                            <td>
                                                                 <p class="mb-1 text-muted"><span class="text-dark fw-medium">176 Item</span> Left</p>
                                                                 <p class="mb-0 text-muted">658 Sold</p>
                                                            </td>
                                                            <td> Shoes</td>
                                                            <td> <span class="badge p-1 bg-light text-dark fs-12 me-1"><i class="bx bxs-star align-text-top fs-14 text-warning me-1"></i> 4.1</span> 370 Review</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="#!" class="btn btn-light btn-sm"><iconify-icon icon="solar:eye-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-primary btn-sm"><iconify-icon icon="solar:pen-2-broken" class="align-middle fs-18"></iconify-icon></a>
                                                                      <a href="#!" class="btn btn-soft-danger btn-sm"><iconify-icon icon="solar:trash-bin-minimalistic-2-broken" class="align-middle fs-18"></iconify-icon></a>
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
                                                  <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                                                  <li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
                                                  <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                                                  <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                                                  <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
                                             </ul>
                                        </nav>
                                   </div>
                              </div>
                         </div>

                    </div>

               </div>
               <!-- End Container Fluid -->

               <!-- ========== Footer Start ========== -->
               <footer class="footer">
                   <div class="container-fluid">
                       <div class="row">
                           <div class="col-12 text-center">
                               <script>document.write(new Date().getFullYear())</script> &copy; Larkon. Crafted by <iconify-icon icon="iconamoon:heart-duotone" class="fs-18 align-middle text-danger"></iconify-icon> <a
                                   href="https://1.envato.market/techzaa" class="fw-bold footer-text" target="_blank">Techzaa</a>
                           </div>
                       </div>
                   </div>
               </footer>
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