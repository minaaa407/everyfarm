package kr.co.everyfarm.payment;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

   private int page;
   private int perPageNum;
   private String searchType;
   private String keyword;
   private String f_Id;
   
   


   public String getF_Id() {
	return f_Id;
}

public void setF_Id(String f_Id) {
	this.f_Id = f_Id;
}

public Criteria() {
      this.page = 1;
      this.perPageNum = 10;
      
      this.searchType = null;
      this.keyword = null;
   }

   public String getSearchType() {
      return searchType;
   }

   public void setSearchType(String searchType) {
      this.searchType = searchType;
   }

   public String getKeyword() {
      return keyword;
   }

   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }

   // pageStart를 반환
   public int getPageStart() {
      return (this.page - 1) * perPageNum;
   }

   public int getPage() {
      return page;
   }

   public void setPage(int page) {
      if (page <= 0) {
         this.page = 1;
      } else {
         this.page = page;
      }
   }

   public int getPerPageNum() {
      return perPageNum;
   }

   public void setPerPageNum(int perPageNum) {
      if (perPageNum <= 0 || perPageNum > 100) {
         this.perPageNum = 10;
      } else {
         this.perPageNum = perPageNum;
      }
   }

   // searchType, keyword 추가
   public String makeQuery() {


      UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
            .queryParam("page", page)
            .queryParam("perPageNum", this.perPageNum);
      if (searchType!=null) {
         uriComponentsBuilder
               .queryParam("searchType", this.searchType)
               .queryParam("keyword", this.keyword);
      


      }
      return uriComponentsBuilder.build().encode().toString();
   }

@Override
public String toString() {
	return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
			+ keyword + ", f_Id=" + f_Id + "]";
}



   
}