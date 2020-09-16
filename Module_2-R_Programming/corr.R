corr <- function(directory, threshold=0){
  ndigits<-function(x){
    nchar(toString(x))
  }

  id<-1:length(list.files(file.path(".",directory)))
  cor_list<-c()
  j=1
  for (i in id) {
    i_string<-toString(i)
    padding<-paste(rep(0,3-nchar(i_string)),collapse="")
    padded_i<-paste(padding,i_string,sep="")
    filename <- paste(padded_i,".csv",sep="")
    filepath<-file.path(".",directory,filename)
    csv<-read.csv(filepath,header=TRUE,stringsAsFactors=FALSE)
    
    if(sum(complete.cases(csv))>threshold){
      complete_csv<-csv[complete.cases(csv),]
      cor_list[[j]]<-cor(complete_csv$sulfate,complete_csv$nitrate)
      j=j+1
    } 
  
  }
  cor_list
}