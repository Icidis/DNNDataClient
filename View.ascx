<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="TalkDotNet.Modules.DNNDataClient.View" %>

<asp:Button ID="btnHelloWorld" runat="server" Text="Get Hello World" OnClientClick="getHelloWorld(); return false;" />
<br />
<br />
<asp:Button ID="btnGoodbyeWorld" runat="server" Text="Post Goodbye World" OnClientClick="postGoodbyeWorld(); return false;" />
<script type="text/javascript">

    var sf = $.ServicesFramework(<%= ModuleId%>);
    var exampleControllerPath = sf.getServiceRoot('DataExchange') + 'Example/';

    function getHelloWorld() {
        try {
            $.ajax({
                type: "GET",
                contentType: "application/json;charset=utf-8",
                url: exampleControllerPath + 'HelloWorld',
                beforeSend: sf.setModuleHeaders,
                data: [],
                success: function (result) {
                    alert(result);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        } catch (e) {
            //Shouldn't do this but it's just for testing
            alert(e.stack);
        }
    };

    function postGoodbyeWorld() {
        try {
            $.ajax({
                type: "POST",
                cache: false,
                url: exampleControllerPath + 'GoodbyeWorld',
                beforeSend: sf.setModuleHeaders,
                data: ({ goodbye: true }),
                success: function (result) {
                    alert(result);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        } catch (e) {
            //Shouldn't do this but it's just for testing
            alert(e.stack);
        }
    };
</script>