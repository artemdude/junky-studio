<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/controls/portfolio/Cokehead.ascx" TagName="Cokehead" TagPrefix="js" %>
<%@ Register Src="~/controls/portfolio/Navigation.ascx" TagName="Navigation" TagPrefix="js" %>
<%@ Register Src="~/controls/portfolio/Logica.ascx" TagName="Logica" TagPrefix="js" %>
<%@ Register Src="~/controls/portfolio/LegalExpert.ascx" TagName="LegalExpert" TagPrefix="js" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Одержимые красотой. JUNKY STUDIO</title>
    <%-- todo: meta --%>
    <link href="<%= ResolveUrl("~/css/style.css") %>" rel="stylesheet" type="text/css" />

    <script src="<%= ResolveUrl("~/script/jquery.js") %>" type="text/javascript"></script>

    <script src="<%= ResolveUrl("~/script/plugins/jquery.scrollTo-min.js") %>" type="text/javascript"></script>

    <script src="<%= ResolveUrl("~/script/plugins/jquery.watermark.min.js") %>" type="text/javascript"></script>

    <script src="<%= ResolveUrl("~/script/site.js") %>" type="text/javascript"></script>

    <script src="<%= ResolveUrl("~/script/plugins/slide/jQuery.wrscroll.js") %>" type="text/javascript"></script>

    <script src="<%= ResolveUrl("~/script/plugins/slide/jquery.mousewheel-3.0.2.pack.js") %>"
        type="text/javascript"></script>

</head>
<body>
    <form id="jform" runat="server">
    <div class="corner-top">
    </div>
    <div id="header">
        <table width="100%">
            <tr>
                <td style="width: 52%">
                    <div id="logo">
                        <a href="http://junkystudio.com">
                            <img alt="junkystudio" src="<%= ResolveUrl("~/images/logo.png") %>" />
                        </a>
                    </div>
                </td>
                <td align="left">
                    <div>
                        <ul id="mainMenu">
                            <li class="portfolio"><a href="javascript:void(0)">Портфолио</a></li>
                            <li class="studio"><a href="javascript:void(0)">Студия</a></li>
                            <li class="contacts"><a href="javascript:void(0)">Контакты</a></li>
                            <li><a href="javascript:void(0)">
                                <img alt="en" align="middle" style="margin-top: -35px;" src="images/labels/en.png" /></a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="corner-black">
        <div class="section section-height">
            <div class="clear" style="height: 40px;">
            </div>
            <div id="hello" style="position: relative;">
                <img style="position: absolute; top: 0px; right: 0px;" src="<%= ResolveUrl("~/images/junkyman.png") %>" />
                <div style="height: 180px;">
                </div>
                <div>
                    <img alt="hello" src="<%= ResolveUrl("~/images/labels/hello.png") %>" />
                    <div class="text">
                        Мы самая одержимая дизайн-студия в Украине, мы любим красоту больше за все в мире,
                        нас прет от нашей работы.
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 60px;">
        </div>
    </div>
    <div class="section-black corner-blue">
        <div class="section section-height">
            <img alt="portfolio" src="<%= ResolveUrl("~/images/labels/portfolio.png") %>" />
            <div class="text" style="color: #fff;">
                Наша работа заключается в том, чтобы найти наиболее удобный, простой и красивый
                способ решения поставленной задачи
            </div>
            <div id="PortfolioGalery">
                <table width="100%">
                    <tr>
                        <td style="width: 200px;">
                            <img alt="cokehead" portfolio="CokeHead" class="p-small p-link" src="<%= ResolveUrl("~/images/portfolio/small/cokehead.png") %>" />
                        </td>
                        <td>
                        </td>
                        <td style="width: 200px;">
                            <img alt="legalexpert" portfolio="LegalExpert" class="p-small p-link" src="<%= ResolveUrl("~/images/portfolio/small/legalexpert.png") %>" />
                        </td>
                        <td>
                        </td>
                        <td style="width: 200px;">
                            <img alt="logica" class="p-small p-link" portfolio="Logica" src="<%= ResolveUrl("~/images/portfolio/small/logica.png") %>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <div class="p-title">
                                <img alt="cokehead" class="p-link" portfolio="CokeHead" src="<%= ResolveUrl("~/images/labels/cokehead.png") %>" /></div>
                            <div class="p-desc"><img alt="Социальная сеть модников" src="<%= ResolveUrl("~/images/labels/social-network.png") %>" /> </div>
                        </td>
                        <td>
                        </td>
                        <td style="text-align: center;">
                            <div class="p-title">
                                <img alt="legalexpert" class="p-link" portfolio="LegalExpert" src="<%= ResolveUrl("~/images/labels/legalexpert.png") %>" /></div>
                            <div class="p-desc"><img alt="Юридические услуги" src="<%= ResolveUrl("~/images/labels/legal-services.png") %>" /></div>
                        </td>
                        <td>
                        </td>
                        <td style="text-align: center;">
                            <div class="p-title">
                                <img alt="logica" class="p-link" portfolio="Logica" src="<%= ResolveUrl("~/images/labels/logica.png") %>" /></div>
                            <div class="p-desc"><img alt="Дизайн-студия" src="<%= ResolveUrl("~/images/labels/logica-design-studio.png") %>" /></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="height: 55px;">
        </div>
    </div>
    <div class="section-blue corner-white">
        <div class="section section-height">
            <img alt="studio" src="<%= ResolveUrl("~/images/labels/studio.png") %>" />
            <div class="text" style="color: #fff;">
                Наша сила — это люди которые у нас работают
            </div>
            <table width="100%">
                <tr>
                    <td style="width: 25%; text-align: center;">
                            <img alt="Alexander Bodnarchuk" src="<%= ResolveUrl("~/images/people/alexander-photo.png") %>" />
                    </td>
                    <td class="center">
                            <img alt="Artem Shkolovy" src="<%= ResolveUrl("~/images/people/artem-photo.png") %>" />
                    </td>
                    <td style="width: 25%; text-align: center;">
                        <img alt="Vladimir Ivchuk" src="<%= ResolveUrl("~/images/people/vladimir-photo.png") %>" />
                    </td>
                </tr>
                <tr>
                    <td class="center">
                        <div class="studio-title">
                            <img alt="art director" src="<%= ResolveUrl("~/images/labels/art-director.png") %>" /></div>
                        <span class="studio-desc"><a href="http://www.bodnarchuk.com.ua">
                            <img src="<%= ResolveUrl("~/images/labels/alexander.png") %>" /></a></span>
                    </td>
                    <td class="center">
                        <div class="studio-title">
                            <img alt="technical director" src="<%= ResolveUrl("~/images/labels/technical-director.png") %>" /></div>
                        <span class="studio-desc"><a href="http://www.shkolovy.com">
                            <img src="<%= ResolveUrl("~/images/labels/artem.png") %>" /></a></span>
                    </td>
                    <td class="center">
                        <div class="studio-title">
                            <img alt="managing-director" src="<%= ResolveUrl("~/images/labels/managing-director.png") %>" /></div>
                        <span class="studio-desc">
                            <img src="<%= ResolveUrl("~/images/labels/vladimir.png") %>" /></span>
                    </td>
                </tr>
            </table>
        </div>
        <div style="height: 80px;">
        </div>
    </div>
    <div class="section-white corner-black">
        <div class="section section-height">
            <img alt="contacts" src="<%= ResolveUrl("~/images/labels/contacts.png") %>" />
            <div style="height: 32px;">
            </div>
            <img alt="044 537 18 35" src="<%= ResolveUrl("~/images/labels/telephone.png") %>" />
            <div class="text" style="width: 100%; padding-top: 23px; padding-bottom: 10px;">
                Улица Лютернаская 20, Киев, Украина, mailbox@junkystudio.com
            </div>
            
            <div id="fbContainer">
            <table id="fbFormTable" width="100%">
                <tr>
                    <td>
                        <input id="nameBox" class="contacts-box" type="text" />
                        <div style="height: 20px;">
                        </div>
                        <input id="phoneBox" class="contacts-box" type="text" />
                        <div style="height: 20px;">
                        </div>
                        <input id="mailBox" class="contacts-box" type="text" />
                    </td>
                    <td width="20px">
                    </td>
                    <td valign="top">
                        <textarea id="messageBox" class="contacts-area" cols="20" rows="2"></textarea>
                        <div style="height: 30px;">
                        </div>
                        <span style="margin-left: 20px;" id="send">
                            <img alt="Send" src="<%= ResolveUrl("~/images/labels/send.png") %>" /></span>
                    </td>
                </tr>
            </table>
            <div class="hide" id="fbSuccess">Спасибо за сотрудничество, мы свяжемся с вами. <span class="fbMore">Отправить еще</span></div>
                <div class="hide" id="fbFail">Произошла ошибка при отправке. <span class="fbMore">Попробовать снова</span></div>
            </div>
        </div>
        <div style="height: 35px;">
        </div>
    </div>
    <div class="section-black">
        <div class="section " style="height: 130px;">
            <table width="100%">
                <tr>
                    <td width="33%">
                        <a href="http://www.facebook.com/pages/JunkyStudio/203887969638148">
                            <img alt="facebook" src="<%= ResolveUrl("~/images/social/facebook.png") %>" /></a>
                    </td>
                    <td style="padding-left: 30px; width: 33%">
                        <a href="http://twitter.com/JunkyStudio">
                            <img alt="twitter" src="<%= ResolveUrl("~/images/social/twitter.png") %>" /></a>
                    </td>
                    <td>
                        <a href="http://vkontakte.ru/club24558939">
                            <img alt="vkontakte" src="<%= ResolveUrl("~/images/social/vkontakte.png") %>" /></a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <a id="toTop" href="javascript:void(0)">
        <img alt="up" src="<%= ResolveUrl("~/images/up.png") %>" />
    </a>
    
    
    <%-- main menu --%>
    <div id="portfolio" style="position: absolute; top: 480px;">
    </div>
    <div id="studio" style="position: absolute; top: 970px;">
    </div>
    <div id="contacts" style="position: absolute; top: 1500px;">
    </div>
    
    <%--portfolio--%>
    <div id="PortfolioContainer">
        
        <js:Navigation ID="Navigation" runat="server" />
        <js:Cokehead ID="Cokehead" runat="server" />
        <js:Logica ID="Logica" runat="server" />
        <js:LegalExpert ID="LegalExpert" runat="server" />
        
    </div>
    
    <div id="loader">
    
    <img src="images/social/twitter.png" alt="twitter">
    
    </div>
    </form>
</body>
</html>
