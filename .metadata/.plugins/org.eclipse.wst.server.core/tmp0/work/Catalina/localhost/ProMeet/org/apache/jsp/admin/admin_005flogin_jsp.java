/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.64
 * Generated at: 2025-04-16 17:24:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/common/footer.html", Long.valueOf(1742493861481L));
    _jspx_dependants.put("/common_html/all_css.html", Long.valueOf(1742493036175L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Admin Login</title>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css\" integrity=\"sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"icon\" href=\"/ProMeet/images/promeet1.jpg\" class=\"rounded-circle\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/ProMeet/css/style.css\">");
      out.write("\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\" />\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("      \r\n");
      out.write("        html, body {\r\n");
      out.write("            height: 100vh;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: column;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        body {\r\n");
      out.write("            background: linear-gradient(to right, #1f1c2c, #928dab);\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-family: 'Poppins', sans-serif;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        .login-form {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\r\n");
      out.write("            backdrop-filter: blur(12px);\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.2);\r\n");
      out.write("            border-radius: 12px;\r\n");
      out.write("            padding: 30px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 400px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);\r\n");
      out.write("            animation: fadeIn 1s ease-in-out;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("      \r\n");
      out.write("        .input-group-text {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.2);\r\n");
      out.write("            color: white;\r\n");
      out.write("            border: none;\r\n");
      out.write("            border-radius: 10px 0 0 10px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-control {\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.5);\r\n");
      out.write("            background: transparent;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-control::placeholder {\r\n");
      out.write("            color: rgba(255, 255, 255, 0.7);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-control:focus {\r\n");
      out.write("            border-color: #ff9800;\r\n");
      out.write("            box-shadow: 0px 0px 10px #ff9800;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        .btn-submit {\r\n");
      out.write("            background: linear-gradient(45deg, #ff9800, #ff5722);\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            padding: 12px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            transition: 0.3s ease-in-out;\r\n");
      out.write("            border: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .btn-submit:hover {\r\n");
      out.write("            background: linear-gradient(45deg, #ff5722, #ff9800);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("        @keyframes fadeIn {\r\n");
      out.write("            from { opacity: 0; transform: translateY(20px); }\r\n");
      out.write("            to { opacity: 1; transform: translateY(0); }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("        .footer-container {\r\n");
      out.write("            margin-top: auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        @media (max-width: 768px) {\r\n");
      out.write("            .login-form {\r\n");
      out.write("                width: 90%;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    .custom-header {\r\n");
      out.write("        background: linear-gradient(to right, #1f1c2c, #535a7b);\r\n");
      out.write("        padding: 15px 25px;\r\n");
      out.write("        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);\r\n");
      out.write("        position: sticky;\r\n");
      out.write("        top: 0;\r\n");
      out.write("        z-index: 1050;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .navbar-brand {\r\n");
      out.write("        color: #fff;\r\n");
      out.write("        font-size: 26px;\r\n");
      out.write("        font-weight: bold;\r\n");
      out.write("        text-transform: uppercase;\r\n");
      out.write("        \r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .logo-icon {\r\n");
      out.write("        color: red;\r\n");
      out.write("        font-size: 32px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .custom-toggler {\r\n");
      out.write("        border: none;\r\n");
      out.write("        background: transparent;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .custom-toggler:focus {\r\n");
      out.write("        outline: none;\r\n");
      out.write("        box-shadow: none;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .custom-offcanvas {\r\n");
      out.write("        background: #2a2d34;\r\n");
      out.write("        color: white;\r\n");
      out.write("        width: 250px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .offcanvas-header {\r\n");
      out.write("        background: #1e1f23;\r\n");
      out.write("        padding: 15px;\r\n");
      out.write("    }\r\n");
      out.write("        \r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container-fluid custom-header d-flex justify-content-between align-items-center\">\r\n");
      out.write("    <div class=\"flex-grow-1 d-flex justify-content-center\">\r\n");
      out.write("        <h2 class=\"navbar-brand m-0 d-flex align-items-center gap-2\">\r\n");
      out.write("            <i class=\"fas fa-user-circle logo-icon\"></i>\r\n");
      out.write("            Admin Portal\r\n");
      out.write("        </h2>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    ");

        String m = (String) request.getAttribute("msg");
        if (m != null) {
    
      out.write("\r\n");
      out.write("    <div class=\"alert alert-warning alert-dismissible fade show text-center\" role=\"alert\">\r\n");
      out.write("        <strong>");
      out.print( m );
      out.write("</strong>\r\n");
      out.write("        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- 📜 Centered Login Form -->\r\n");
      out.write("    <div class=\"container d-flex justify-content-center align-items-center flex-grow-1\">\r\n");
      out.write("        <form action=\"/ProMeet/AdminLogin\" method=\"post\" class=\"login-form\">\r\n");
      out.write("            <h2 class=\"text-warning mb-4\">Admin Login</h2>\r\n");
      out.write("\r\n");
      out.write("            <!-- Email Input -->\r\n");
      out.write("            <div class=\"mb-3 input-group\">\r\n");
      out.write("                <span class=\"input-group-text\"><i class=\"fa fa-envelope\"></i></span>\r\n");
      out.write("                <input type=\"email\" name=\"adminEmail\" placeholder=\"Enter Email Here\" class=\"form-control\" required>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <!-- Password Input -->\r\n");
      out.write("            <div class=\"mb-3 input-group\">\r\n");
      out.write("                <span class=\"input-group-text\"><i class=\"fas fa-key\"></i></span>\r\n");
      out.write("                <input type=\"password\" name=\"adminPass\" placeholder=\"Enter Password Here\" class=\"form-control\" required>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <!-- Submit Button -->\r\n");
      out.write("            <button class=\"btn btn-submit\">\r\n");
      out.write("                <i class=\"fa fa-lock\"></i> Submit\r\n");
      out.write("            </button>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("   \r\n");
      out.write("    <div class=\"footer-container\">\r\n");
      out.write("        ");
      out.write("<footer class=\" text-center\" style=\"background-color: cyan\">\r\n");
      out.write("  <!-- Grid container -->\r\n");
      out.write("  <div class=\"container p-4 pb-0\">\r\n");
      out.write("    <!-- Section: Social media -->\r\n");
      out.write("    <section class=\"mb-4\">\r\n");
      out.write("      <!-- Facebook -->\r\n");
      out.write("      <a\r\n");
      out.write("      data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #3b5998;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-facebook-f\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Twitter -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #55acee;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-twitter\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Google -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #dd4b39;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-google\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Instagram -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #ac2bac;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-instagram\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Linkedin -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #0082ca;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-linkedin-in\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("      <!-- Github -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #333333;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-github\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("    </section>\r\n");
      out.write("    <!-- Section: Social media -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- Grid container -->\r\n");
      out.write("\r\n");
      out.write("  <!-- Copyright -->\r\n");
      out.write("  <div class=\"text-center p-3\" style=\"background-color: rgb(0, 0, 64); color:red;\">\r\n");
      out.write("    Â© 2025 Copyright Created By Prince\r\n");
      out.write("    \r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- Copyright -->\r\n");
      out.write("</footer>");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
