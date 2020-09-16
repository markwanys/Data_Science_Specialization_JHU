pollutantmean <- function(directory, pollutant, id=1:332){
  ndigits<-function(x){
    nchar(toString(x))
  }
  
  csv_list<-as.list(seq_along(id))
  for (i in id) {
    i_string<-toString(i)
    padding<-paste(rep(0,3-nchar(i_string)),collapse="")
    padded_i<-paste(padding,i_string,sep="")
    filename <- paste(padded_i,".csv",sep="")
    filepath<-file.path(".",directory,filename)
    csv_list[[i]]<-read.csv(filepath,header=TRUE,stringsAsFactors=FALSE)
  }
  d<-do.call("rbind",csv_list)
  mean(d[[pollutant]],na.rm=TRUE)
}