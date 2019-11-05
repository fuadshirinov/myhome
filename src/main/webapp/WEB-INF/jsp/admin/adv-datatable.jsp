<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 17.10.19
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Elanlar</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="${pageContext.servletContext.contextPath}/admin/assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
</head>
<body class="fixed-navbar">
<div class="page-wrapper">

    <jsp:include page="header.jsp"/>
    <!-- END HEADER-->
    <!-- START SIDEBAR-->
    <jsp:include page="sidebar.jsp"/>
    <!-- END SIDEBAR-->
    <div class="content-wrapper">
        <!-- START PAGE CONTENT-->

        <div class="page-content fade-in-up">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Data Table</div>
                </div>
                <div class="ibox-body">
                    <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Elan növü</th>
                            <th>Əmlak növü</th>
                            <th>Qiymət</th>
                            <th>Məzənnə</th>
                            <th>Şəhər</th>
                            <th>Yerləşdirmə tarixi</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="${pageContext.servletContext.contextPath}/admin/assets/js/app.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script type="text/javascript">
    $(document).ready(function () {
        $('#example-table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": "${pageContext.servletContext.contextPath}/rest/admin-adv-datatable?process_status=${processStatus}",
            "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
            lengthChange:false,
            searching:false,
            "language": {
                "emptyTable": "Gosterilecek elan yoxdur"
            }
        });
    });
</script>
<script>
    function confirmadv(advID) {
        $.ajax({
            url:'${pageContext.servletContext.contextPath}/rest/activate-adv?id='+advID,
            success:function(success1){
                if (success1){
                    alert("Elan tesdiqlendi");
                }else{
                    alert("xeta bas verdi");
                }
            }
        })
    }

    function deleteAdv(advID) {
        $.ajax({
            url:'${pageContext.servletContext.contextPath}/rest/ignore-adv?id='+advID,
            success:function (success2) {
                if (success2){
                    alert("Elan silindi");
                }else{
                    alert("xeta bas verdi");
                }
            }
        })
    }
</script>

</body>
</html>
