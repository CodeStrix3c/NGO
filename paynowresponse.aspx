<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paynowresponse.aspx.cs" Inherits="paynowresponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ehsaase-e-Insaniyat Trust: Payment Received.</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link href="css/donateresponse.css" rel="stylesheet" />
</head>
<body>
    
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="widget-box">
                <div class="widget-header widget-header-large">
                    <h3 class="widget-title grey lighter"><a href="default.aspx">Ehsaase-e-Insaniyat Trust receipt</a>
                    </h3>

                    <div class="widget-toolbar no-border invoice-info">
                        <span class="invoice-info-label">Order Id:</span>
                        <span class="red"><asp:Literal ID="ltrinvoice" runat="server"/></span>

                        <br>
                        <span class="invoice-info-label">Date:</span>
                        <span class="blue"><asp:Literal ID="ltrorderdate" runat="server" /></span>
                    </div>

                    <div class="widget-toolbar hidden-480">
                        <a href="#" onclick="window.print()">
                            <i class="ace-icon fa fa-print"></i>
                        </a>
                    </div>
                </div>

                <div class="widget-body">
                    <div class="widget-main padding-24">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                        <b>Customer Info</b>
                                    </div>
                                </div>

                                <div>
                                    <ul class="list-unstyled spaced">
                                        <li><strong>Customer : </strong><asp:Literal ID="ltrname" runat="server"/></li>
                                        <li><strong>Address : </strong><asp:Literal ID="ltraddress" runat="server"/></li>

                                       
                                    </ul>
                                </div>
                            </div>
                            <!-- /.col -->

                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                        <b>Payment Info</b>
                                    </div>
                                </div>

                                <div>
                                    <ul class="list-unstyled  spaced">
                                        <li><asp:Literal ID="ltrmode" runat="server"/></li>
                                        <li><asp:Literal ID="ltrcardname" runat="server"/></li>

                                       
                                    </ul>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->

                        <div class="space"></div>

                        <div>
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Order No.</th>
                                        <th class="hidden-xs">CCAvenue Reference</th>
                                        <th class="hidden-480">Bank Ref</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>

                                        <td><asp:Literal ID="ltrorder" runat="server"/>
                                        </td>
                                        <td class="hidden-xs"><asp:Literal ID="ltrccref" runat="server"/>
                                        </td>
                                        <td class="hidden-480"><asp:Literal ID="ltrbankref" runat="server"/></td>
                                        <td><asp:Literal ID="ltramount" runat="server"/></td>
                                    </tr>

                                   
                                </tbody>
                            </table>
                        </div>

                        <div class="hr hr8 hr-double hr-dotted"></div>

                        <div class="row">
                            <div class="col-sm-5 pull-right">
                                <h4 class="pull-right">Total amount :
									<span class="red"><asp:Literal ID="ltrgrandtotal" runat="server"/></span>
                                </h4>
                            </div>
                            
                        </div>

                        <div class="space-6"></div>
                        <div class="well">
                            Thank you for your Payment.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
