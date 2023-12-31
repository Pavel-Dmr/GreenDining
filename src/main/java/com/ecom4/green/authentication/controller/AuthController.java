package com.ecom4.green.authentication.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.encryption.service.EncryptionService;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.authentication.service.AuthServiceImpl;
import com.ecom4.green.authentication.wrapper.RegistrationForm;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dao.MerchantDAO;
import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/auth")
public class AuthController
{
        private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AuthController.class);

        private static final String pepper = "qc822";

        @Autowired
        AuthService authService;

        @Autowired
        EncryptionService encryptionService;

        /*로그인페이지*/
        @GetMapping("/login")
        public String loginView(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
        {

	      String main = "";
	      String url = null;
	      String msg = "";


	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    url = "redirect:/user/my-page";
		    return url;

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    url = "redirect:/merchant/my-page";
		    return url;

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    main = "auth/view/Login";
	      }


	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반or사업자 회원가입*/
        @RequestMapping("/sign-up")
        public String signUpView(HttpServletRequest req, HttpServletResponse resp, Model model)
        {

	      String main = null;
	      String url = null;
	      main = "auth/view/Registration";

	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반 회원가입*/
        @GetMapping("/sign-up/user")
        public String signUpUserForm(HttpServletRequest req, HttpServletResponse resp, Model model, UserDTO userDto)
        {
	      String main = null;

	      main = "auth/form/user/SignUp";

	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반 회원가입 기입된 정보 보낼때*/
        @PostMapping("/sign-up/user")
        public String signUpUser(UserDTO userDto, HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = null;
	      String url = null;
	      logger.warn(userDto.toString());
	      url = "redirect:/auth/login";


	      try
	      {
		    userDto.setRole(RoleStatus.USER);
		    userDto.setSalt(RandomStringUtils.randomAlphabetic(10));
		    String encryptionPassword = encryptionService.getSHA256Hash(userDto.getPassword() + userDto.getSalt() + pepper);
		    userDto.setPassword(encryptionPassword);

		    int r = authService.signUpUser(userDto);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      return url;
        }

        @PostMapping("/delete/user")
        @ResponseBody
        public ResponseEntity<?> deleteUser(HttpSession session, UserDTO userDTO)
        {
	      Map<String, Object> map = new HashMap<>();
	      String url = "";
	      String msg = "";
	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    userDTO.setRole(RoleStatus.DELETED);
		    authService.updateUserByUserDTO(userDTO);
		    msg = "정상적으로 탈퇴 되었습니다.이후 30일동안 가탈퇴 상태가 되며, 언제든지 철회할수 있습니다.";
		    url = "/auth/logoutProc";
		    map.put("url", url);
		    map.put("msg", msg);

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @RequestMapping("/id-check")
        @ResponseBody
        public ResponseEntity<?> idCheck(HttpServletRequest request, HttpServletResponse response, Model model, UserDTO userDto)
        {
	      int cnt = 0;
	      Map<String, Object> map = new HashMap<>();
	      if (userDto.getId() != null)
	      {
		    cnt = authService.idCheck(userDto.getId());
	      }
	      map.put("cnt", cnt);
	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @RequestMapping("/phone-check")
        @ResponseBody
        public ResponseEntity<?> phoneCheck(HttpServletRequest req, HttpServletResponse resp, Model model, UserDTO userDto)
        {
	      int cnt = 0;
	      Map<String, Object> map = new HashMap<>();
	      if (userDto.getPhone() != null)
	      {
		    cnt = authService.phoneCheck(userDto.getPhone());
	      }
	      map.put("cnt", cnt);

	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @RequestMapping("/password-check")
        @ResponseBody
        public ResponseEntity<?> passwordCheck(HttpServletRequest req, HttpServletResponse resp, Model model, UserDTO userDto)
        {
	      Map<String, Object> map = new HashMap<>();
	      String msg = "";
	      try
	      {
		    String salt = authService.selectSalt(userDto);
		    String encyptionPassword = encryptionService.getSHA256Hash(userDto.getPassword() + salt + pepper);
		    userDto.setPassword(encyptionPassword);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }
	      UserDTO udto = authService.getUser(userDto);

	      if (udto.getRole() == RoleStatus.USER)
	      {
		    msg = "비밀번호가 맞습니다";
		    map.put("msg", msg);
	      }
	      else
	      {
		    msg = "비밀번호가 틀립니다.";
		    map.put("msg", msg);
		    return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @GetMapping("/sign-up/business")
        public String signUpBusinessForm(HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = null;

	      main = "auth/form/business/SignUp";

	      model.addAttribute("main", main);

	      return "Index";
        }


        @PostMapping("/sign-up/business")
        public String signUpBusiness(HttpServletRequest req, HttpServletResponse resp, Model model, @ModelAttribute RegistrationForm form)
        {
	      String url = null;
	      String msg;

	      int r = 0;

	      try
	      {
		    UserDTO userDTO = form.getUserDTO();
		    MerchantDTO merchantDTO = form.getMerchantDTO();

		    r = authService.signUpBusiness(userDTO, merchantDTO);

	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      if (r > 0)
	      {
		    url = "/auth/login";
		    msg = "사업자 회원가입 성공";
	      }
	      else
	      {
		    msg = "사업자 회원가입 실패 다시 시도해주세요";
		    url = "/auth/sign-up/business";
	      }

	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);

	      return "MsgPage";
        }

        @PostMapping("/loginProc")
        public String loginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response, UserDTO userDto, Model model)
        {

	      try
	      {
		    String salt = authService.selectSalt(userDto);
		    String encyptionPassword = encryptionService.getSHA256Hash(userDto.getPassword() + salt + pepper);
		    userDto.setPassword(encyptionPassword);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }
	      UserDTO udto = authService.getUser(userDto);
	      String url = "redirect:/";
	      String msg;


	      if (udto == null)
	      {
		    msg = "아이디 또는 패스워드가 맞지 않습니다.";
	      }
	      else
	      {
		    UserDTO ssKey = new UserDTO();
		    ssKey.setId(udto.getId());
		    ssKey.setPassword(udto.getPassword());
		    ssKey.setName(udto.getName());
		    ssKey.setRole(udto.getRole());
		    ssKey.setEmail(udto.getEmail());
		    msg = udto.getName() + "님 반갑습니다!!";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		    session.setAttribute("ssKey", ssKey);
	      }

	      return url;
        }

        @RequestMapping("/logoutProc")
        public String logoutProc(HttpServletRequest request, HttpServletResponse response, UserDTO userdto, Model model)
        {

	      String url = "redirect:/";

	      HttpSession session = request.getSession();
	      session.invalidate();
	      return url;
        }

        //        단일 필드 수정 요
        @ResponseBody
        @PostMapping("/id-change")
        public ResponseEntity<?> idChange(HttpSession session, UserDTO userDTO, Model model)
        {
	      String msg = "";
	      String url = "";
	      Map<String, Object> map = new HashMap<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    authService.updateUserByUserDTO(userDTO);
		    url = "/auth/logoutProc";
		    msg = "아이디를 정상적으로 변경 했습니다. 다시 로그인 해주세요.";
		    map.put("msg", msg);
		    map.put("url", url);
	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @PostMapping("/email-change")
        @ResponseBody
        public ResponseEntity<?> emailChange(HttpSession session, UserDTO userDTO, Model model)
        {
	      String msg = "";
	      Map<String, Object> map = new HashMap<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {

		    authService.updateUserByUserDTO(userDTO);
		    msg = "이메일를 정상적으로 변경 했습니다";
		    map.put("msg", msg);

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);
        }

        @PostMapping("/name-change")
        @ResponseBody
        public ResponseEntity<?> nameChange(HttpSession session, UserDTO userDTO, Model model)
        {
	      String msg = "";
	      Map<String, Object> map = new HashMap<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {

		    authService.updateUserByUserDTO(userDTO);
		    msg = "성함를 정상적으로 변경 했습니다";
		    map.put("msg", msg);

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);

        }

        @PostMapping("/phone-change")
        @ResponseBody
        public ResponseEntity<?> phoneChange(HttpSession session, UserDTO userDTO, Model model)
        {
	      String msg = "";
	      Map<String, Object> map = new HashMap<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {

		    authService.updateUserByUserDTO(userDTO);
		    msg = "휴대폰 번호를 정상적으로 변경 했습니다";
		    map.put("msg", msg);

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);

        }

        @PostMapping("/password-change")
        @ResponseBody
        public ResponseEntity<?> passwordChange(HttpSession session, UserDTO userDTO, Model model)
        {
	      String msg = "";
	      String url = "";
	      Map<String, Object> map = new HashMap<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    try
		    {
			  String salt = authService.selectSalt(userDTO);
			  String encyptionPassword = encryptionService.getSHA256Hash(userDTO.getPassword() + salt + pepper);
			  String new_encyptionPassword = encryptionService.getSHA256Hash(userDTO.getNew_password() + salt + pepper);
			  userDTO.setPassword(encyptionPassword);
			  userDTO.setNew_password(new_encyptionPassword);

		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
		    UserDTO udto = authService.getUser(userDTO);

		    if (udto == null)
		    {
			  map.put("msg", msg);
			  return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		    }
		    else
		    {

			  authService.updateUserByUserDTO(userDTO);
			  msg = "비밀번호를 정상적으로 변경 했습니다. 다시 로그인 요청 드립니다.";
			  url = "/auth/logoutProc";
			  map.put("msg", msg);
			  map.put("url", url);
		    }
	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(map, HttpStatus.OK);

        }

}
