package co.company.papang.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NqVO {
	private String nq_no;
	private String nq_title;
	private String nq_content;
	private String nq_category;
	private String nq_file;
	private String nq_date;
	private String nq_hit;
	private String ad_id;
}
