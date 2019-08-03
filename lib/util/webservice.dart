import 'package:flutter/material.dart';

class WebService {
//Web Service Details
  static const String URL =
      "http://52.11.192.172:19080/coreConnectPayroll/WebService/PortalWebService?wsdl";
  static const String SOAP_ACTION =
      "http://52.11.192.172:19080/coreConnectPayroll/WebService/PortalWebService";
  static const String NAMESPACE = "http://webservice.core.eba.com/";

//Login Service Details
  static const String METHOD_NAME_Login = "getUserProfile";
  static const String Login_Service =
      "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" " +
          " xmlns:web=\"http://webservice.core.eba.com/\"> " +
          " <soapenv:Header/> " +
          " <soapenv:Body> " +
          "  <web:getUserProfile> " +
          "     <search> " +
          "        <companyId>1</companyId> " +
          "        <loginId>antony</loginId> " +
          "        <code>antony@123</code> " +
          "     </search> " +
          "  </web:getUserProfile> " +
          " </soapenv:Body> " +
          " </soapenv:Envelope> ";

//PaySlip Service Details
  static const String METHOD_NAME_GetPaySlip = "getPayslip";
  static const String METHOD_NAME_GetPaySummary = "getPaySummary";
  static const String METHOD_NAME_GetTaxForm = "getTaxForm";

//Leave & Attendance Service Details
  static const String METHOD_NAME_GetLeaveBalance = "getLeaveBalance";
  static const String METHOD_NAME_GetEncashment = "getEncashment";
  static const String METHOD_NAME_GetOverTime = "getOvertime";
  static const String METHOD_NAME_GetLeaveRequest = "getLeaveRequest";
  static const String METHOD_NAME_SubmitLeaveRequest = "submitLeaveRequest";
  static const String METHOD_NAME_SubmitEncashmentRequest =
      "submitEncashmentRequest";
  static const String METHOD_NAME_CancelLeaveRequest = "cancelLeaveRequest";

//Reimbursement Service Details
  static const String METHOD_NAME_GetReimbursement = "getReimbursementRequest";
  static const String METHOD_NAME_SubmitReimbursement =
      "submitReimbursementRequest";
  static const String METHOD_NAME_CancelReimbursement =
      "cancelReimbursementRequest";
}
