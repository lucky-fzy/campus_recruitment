package com.ldu.bs.service;

import com.ldu.bs.bean.Authentication;
import com.ldu.bs.bean.AuthenticationExample;
import com.ldu.bs.bean.Company;
import com.ldu.bs.dao.AuthenticationMapper;
import com.ldu.bs.utils.SendEmail;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.internet.AddressException;
import java.util.List;

@Service
public class AuthenticationService {

    @Autowired
    AuthenticationMapper authenticationMapper;
    @Autowired
    CompanyService companyService;

    public void addAuthentication(Integer companyId, String license,String date) {
        Authentication authentication = new Authentication();
        authentication.setCompanyId(companyId);
        authentication.setLicense(license);
        authentication.setAuthDate(date);
        authentication.setIsauth("0");
        authenticationMapper.insertSelective(authentication);
    }

    public Boolean getLicense(Integer companyId) {
        AuthenticationExample authenticationExample = new AuthenticationExample();
        AuthenticationExample.Criteria criteria = authenticationExample.createCriteria();
        criteria.andCompanyIdEqualTo(companyId).andIsauthEqualTo("0");
        return authenticationMapper.selectByExample(authenticationExample).isEmpty();
    }

    public List<Authentication> getAllAuth() {
        AuthenticationExample example = new AuthenticationExample();
        AuthenticationExample.Criteria criteria = example.createCriteria();
        criteria.andIsauthEqualTo("0");
        return authenticationMapper.selectByExample(example);
    }

    public String updateAuth(Authentication authentication, String type) {
        Company company = companyService.getCompanyDetail(authentication.getCompanyId());
        if (type.equals("ok")){
            authentication.setIsauth("1");
            company.setIsAuthentication("1");
            companyService.updateCompanyInfo(company);
            authenticationMapper.updateByPrimaryKeySelective(authentication);
        }else {
            try {
                SendEmail.sendEmail(company.getCompanyEmail(),"【校园招】由于认证材料不足，认证失败，请准备好材料再申请认证");
            } catch (AddressException e) {
                e.printStackTrace();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            authenticationMapper.deleteByPrimaryKey(authentication.getAuthenticationId());
        }
        return type;
    }

    public Authentication getAuth(Integer id) {
        return authenticationMapper.selectByPrimaryKey(id);
    }
}
