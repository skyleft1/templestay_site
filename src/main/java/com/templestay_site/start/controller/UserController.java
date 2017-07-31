package com.templestay_site.start.controller;


import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.templestay_site.start.commons.WebConstants;
import com.templestay_site.start.model.ModelUser;
import com.templestay_site.start.service.IServiceUser;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    @Qualifier("serviceuser")
    IServiceUser srv;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/user_login", method = RequestMethod.GET)
	public String login(Model model
	        , HttpSession session
	        ) {
		logger.info("user_login");

		ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
		    return "redirect:/";
		}else{
		    // URL을 직접 치고들어오는 상황 회피하자
		    return "user/user_login";
		    
		}
	}
	
    @RequestMapping(value = "/user_login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String , Object> login(Model model
            , @ModelAttribute ModelUser user
            , @RequestParam(value="userid", defaultValue="") String userid
            , @RequestParam(value="userpassword", defaultValue="") String userpassword
            , HttpSession session
            ) {
        logger.info("login:POST");

        ModelUser result = srv.login(userid, userpassword) ;
        
        if(result != null){
            session.setAttribute(WebConstants.SESSION_NAME, result);
            session.getAttribute(userid);
            
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("code"  , 1);
            map.put("userid", userid);
            
            return map;
        }else{
            return null;
        }
        
    }
    
    
    @RequestMapping(value = "/user_logout", method = RequestMethod.GET)
    public String logout(Model model
            , HttpSession session
            ) {
        logger.info("logout");
        
        session.removeAttribute(WebConstants.SESSION_NAME);

        return "redirect:/";
        
    }
    
    
    @RequestMapping(value = "/user_join", method = RequestMethod.GET)
    public String join(Locale locale, Model model) {
        logger.info("join:GET");
        
        return "user/user_join";
    }

    @RequestMapping(value = "/user_join", method = RequestMethod.POST)
    public String join(
            Model model 
            , @ModelAttribute ModelUser userinfo
            ) {
        logger.info("join:POST");
        
        int result = srv.insertUser(userinfo); 
        
        if(result == 1) {
            return "redirect:/user/user_login";
        } else {
            model.addAttribute("userinfo", userinfo );
            return "redirect:/user/user_join";
        }
    }
    
    @RequestMapping(value = "/user_info", method = RequestMethod.GET)
    public String user_info( Model model 
            , HttpSession session
            ){
        logger.info("user_info");

        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
            ModelUser info = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
            model.addAttribute("info", info);

            return "user/user_info";
        } else{
            return "redirect:/";
        }
    }
    
    @RequestMapping(value = "/user_modify", method = RequestMethod.GET)
    public String user_modify_GET( Model model 
            , HttpSession session
            ) {
        logger.info("user_modify");
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
            ModelUser modify = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
            model.addAttribute("modify", modify);

            return "user/user_modify";
        }else{
            return "redirect:/";
        }
    }
    
    @RequestMapping(value = "/user_modify", method = RequestMethod.POST)
    public String user_modify_POST( Model model
            , @RequestParam(value="userid", defaultValue="") String userid
            , @ModelAttribute ModelUser updateValue
            , HttpSession session
            ) {
        logger.info("user_modify:POST");
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
            ModelUser searchValue = srv.getUserOne(userid);
            int result = srv.updateUser(updateValue, searchValue);
            
            if (result == 1) {
                session.setAttribute(WebConstants.SESSION_NAME, srv.getUserOne(user.getUserid()));
                return "redirect:/user/user_info";
            }else{
                return "redirect:/user/user_info";
            }
        }else{
            return "redirect:/user/user_login";
        }
    }
    
    
    @RequestMapping(value = "/user_modify_password", method = RequestMethod.GET)
    public String user_modify_password_GET( Model model 
            , HttpSession session
            ) {
        logger.info("user_modify_password:GET");

        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
            return "user/user_modify_password";
        }else{
            return "redirect:/user/user_login";
        }
    }
    
    @RequestMapping(value = "/user_modify_password", method = RequestMethod.POST)
    public String user_modify_password_POST( Model model
            , @RequestParam(value="currentpassword", defaultValue="") String currentpassword
            , @RequestParam(value="newpassword", defaultValue="") String newpassword
            , HttpSession session
            ) {
        logger.info("user_modify_password:POST");
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user != null){
            int result = srv.updatePassword(newpassword, currentpassword, user.getUserid());
            
            if(result == 1){
                session.removeAttribute(WebConstants.SESSION_NAME);
                // 세션종료시키고 변경성공 화면으로 가자
                return "user/user_modify_password_success";                
            }else{
                // 로그인 실패 메시지 보내고 비밀번호변경 페이지로 가자
                return "redirect:/user_modify_password";
            }
        }else{
            return "redirect:/user/user_login";
        }
    }
    
    @RequestMapping(value = "/user_modify_password_success", method = RequestMethod.POST)
    public String user_modify_password_success( Model model
            , HttpSession session
            ) {
        logger.info("user_modify_password_success");
        
        return "user/user_modify_password_success";
    }
    
    
    @RequestMapping(value = "/user_delete", method = RequestMethod.GET)
    public String user_delete( Model model
            , HttpSession session
            ) {
            logger.info("user_delete");
        
            ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
            if(user != null){
                int result = srv.deleteUser(user);
                
                if(result == 1){
                    // 세션종료시키고 삭제 성공 화면으로
                    session.removeAttribute(WebConstants.SESSION_NAME);
                    return "user/user_delete_success";                
                }else{
                    return "redirect:/user/user_login";
                }
            }else{
                return "redirect:/user/user_login";
        }
    }
}
