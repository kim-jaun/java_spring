package utils;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import model.Member;
public class LoginValidator implements Validator {
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}
	public void validate(Object command, Errors errors) {
		Member member = (Member) command;
		if (!StringUtils.hasLength(member.getmId())) {
			errors.rejectValue("userId", "error.required");
		}
		if (!StringUtils.hasLength(member.getPassword())) {
			errors.rejectValue("password", "error.required");
		}
		if (errors.hasErrors()) {
			errors.reject("error.input.user");
		}
	}
}