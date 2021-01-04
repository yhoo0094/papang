package co.company.papang.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tran_infoVO {
	private String tran_no;
	private String bag_no;
	private String waybill;
	private String tran_date;
	private String tran_status;
	private String tran_sum;
}
