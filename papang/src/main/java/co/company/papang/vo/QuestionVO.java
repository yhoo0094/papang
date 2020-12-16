package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionVO {
	private String q_no;
	private String mbr_id;
	private String q_title;
	private String q_content;
	private String q_category;
}
