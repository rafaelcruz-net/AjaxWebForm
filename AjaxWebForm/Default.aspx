<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "http://localhost:1141/Default.aspx/GetUsers",
                data: {},
                contentType: "application/json",
                dataType: "json",
                success: function (response) {

                    var container = $("#container");

                    $.each(response.d, function (i, e) {
                        var tr = $("<tr id='" + e.Id + "'></tr>");
                        var button = $("<button data-id='" + e.Id + "'>Excluir</button>");
                        var tdButton = $("<td></td>");

                        $(tdButton).append(button);

                        $(tr).append("<td>" + e.Id + "</td>");
                        $(tr).append("<td>" + e.Nome + "</td>");
                        $(tr).append("<td>" + e.Email + "</td>");
                        $(tr).append(tdButton);

                        button.click(function (ev) {
                            ev.preventDefault();
                            var id = $(this).attr("data-id");

                            $.ajax({
                                type: "POST",
                                url: "http://localhost:1141/Default.aspx/DeleteUser",
                                data: JSON.stringify({id:id}),
                                contentType: "application/json",
                                dataType: "json",
                                success: function (response) {
                                    if (response.d.Message == "OK") {
                                        $("tr[id='" + id + "']").fadeOut();
                                    }
                                }
                            });

                        });


                        $(container).find("table tbody").append(tr);
                    });
                }
            });

           
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="MainContent" ContentPlaceHolderID="MainContent">
    <section class="featured" id="container">
        <table>
            <thead>
                <tr>
                    <th>#Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </section>
</asp:Content>
