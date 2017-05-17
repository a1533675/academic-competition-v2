package com.fuchen.academic.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * 审核步骤Tag
 * @author yshin1992
 *
 */
public class CompetitionCheckStepTag extends SimpleTagSupport {

	/**
	 * 步骤
	 */
	private Integer step;

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	@Override
	public void doTag() throws JspException, IOException {
		String result = "";
		if(null != step){
			switch (step) {
			case -1:
				result="审核拒绝";
				break;
			case 0:
				result="待审";
				break;
			case 1:
				result="一级审核";
				break;
			case 2:
				result="二级审核";
				break;
			case 3:
				result="审核通过";
				break;
			case 4:
				result="审核拒绝";
				break;
			default:
				break;
			}
		}
		
		getJspContext().getOut().write(result);
		getJspContext().getOut().flush();
	}
	
	
	
}
