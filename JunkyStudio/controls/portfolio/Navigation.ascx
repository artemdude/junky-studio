<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navigation.ascx.cs" Inherits="controls_portfolio_Navigation" %>
<link href="<%= ResolveUrl("~/css/portfolio.css") %>" rel="stylesheet" type="text/css" />
<div id="PortfolioNavigation" style="">
    <img alt="center" id="OnStartPortfolio" src="<%= ResolveUrl("~/images/portfolio/center.png") %>" />
    <img alt="close" id="ClosePortfolio" src="<%= ResolveUrl("~/images/portfolio/close.png") %>" />
    <a href="<%= ResolveUrl("~/") %>"><img alt="junkystudio" id="LogoPortfolio" src="<%= ResolveUrl("~/images/portfolio/portfolio-logotype.png") %>" /></a>
</div>
