complete <- function(directory, id=1:332){
  ndigits<-function(x){
    nchar(toString(x))
  }
  
  complete_cases_list<-seq_along(id)
  j=1
  for (i in id) {
    i_string<-toString(i)
    padding<-paste(rep(0,3-nchar(i_string)),collapse="")
    padded_i<-paste(padding,i_string,sep="")
    filename <- paste(padded_i,".csv",sep="")
    filepath<-file.path(".",directory,filename)
    csv<-read.csv(filepath,header=TRUE,stringsAsFactors=FALSE)
    complete_cases_list[[j]]<-sum(complete.cases(csv))
    j=j+1
  }
  data.frame(id=id,nobs=complete_cases_list)
}