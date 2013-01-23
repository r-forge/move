setGeneric('unUsedRecords<-', function(obj, value){standardGeneric('unUsedRecords<-')})
setMethod('unUsedRecords<-', c(obj='.MoveTrackSingle', value='logical'), function(obj, value){
	  if(n.locs(obj)!=length(value))
		  stop('Selection length does not match with number of locations')
	  unUsed<-as(obj, '.unUsedRecords')
	  xNew<-obj[!value,]
	  xOld<-obj[value,]
	  df1<-unUsed@dataUnUsedRecords 
	  df2<-xOld@data
	  df2[,setdiff(names(df1),names(df2))] <- NA
	  df1[,setdiff(names(df2),names(df1))] <- NA
	  df3 <- rbind(df1,df2) 
	  unUsedNew<-new('.unUsedRecords', 
		      timestampsUnUsedRecords=ifelse(is.null(unUsed@timestampsUnUsedRecords), list(xOld@timestamps),list(c(unUsed@timestampsUnUsedRecords, xOld@timestamps)))[[1]],   
		      sensorUnUsedRecords=factor(c(as.character(unUsed@sensorUnUsedRecords), as.character(xOld@sensor))),
		      dataUnUsedRecords=df3
		      ) 
	  new(class(obj), unUsedNew, xNew)
})
setMethod('unUsedRecords<-', c(obj='.MoveTrackStack', value='logical'), function(obj, value){
	  if(sum(n.locs(obj))!=length(value))
		  stop('Selection length does not match with number of locations')
	  unUsed<-as(obj, '.unUsedRecordsStack')
	  xNew<-obj[!value,]
	  xOld<-obj[value,]
	  df1<-unUsed@dataUnUsedRecords 
	  df2<-xOld@data
	  df2[,setdiff(names(df1),names(df2))] <- NA
	  df1[,setdiff(names(df2),names(df1))] <- NA
	  df3 <- rbind(df1,df2) 
	  unUsedNew<-new('.unUsedRecordsStack', 
		      timestampsUnUsedRecords=ifelse(is.null(unUsed@timestampsUnUsedRecords), list(xOld@timestamps),list(c(unUsed@timestampsUnUsedRecords, xOld@timestamps)))[[1]],   
		      sensorUnUsedRecords=factor(c(as.character(unUsed@sensorUnUsedRecords), as.character(xOld@sensor))),
		      trackIdUnUsedRecords=factor(c(as.character(unUsed@trackIdUnUsedRecords), as.character(xOld@trackId))),
		      dataUnUsedRecords=df3
		      ) 
	  new(class(obj),  unUsedNew, xNew)
})

