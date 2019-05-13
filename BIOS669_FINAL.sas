*********************************************************************
*  Assignment:    Final Project                                        
*
*  Name:          Ragi Nayak
*
*  Date:          5/1/2019                                        
*------------------------------------------------------------------- 
*  Job name:      FINAL_rnayak.sas   
*
*  Purpose:       Analyze the change in adlib use over time, since
*				  the beginning of rap music. 
*                                         
*  Language:      SAS, VERSION 9.4  
*
*  Input:         CSVs with randomly selected samples of rap music 
*				  from 1979 until 2019
*
*  Output:        A dataset with broken-down adlibs over time and 
*				  graphs depicting the change in adlib use.    
*                                                                    
********************************************************************;

OPTIONS NODATE MERGENOBY=WARN VARINITCHK=WARN;

data yearlist;
	input year;
	datalines;
	1979
	1983
	1987
	1991
	1995
	1999
	2003
	2007
	2011
	2015
	2019
	;
run;

proc sql noprint;
    select year into :yearlist separated by ' '
        from work.yearlist; 
quit;

%put &yearlist;

libname data 'C:\Users\rnayak\Downloads\BIOS669_Final';

%macro strip_parantheses;

	%let i=1;
    
    %do %until (%scan(&yearlist,&i)=);
        %let year=%scan(&yearlist,&i);

	data adlib&year;
		set data.sas&year;

		if find(lyric, '(');
		
    	where_open=find(lyric,'(');
    	where_close=find(lyric,')');
    	
    	lyric_line=lowcase(strip(substr(lyric,where_open+1,where_close-where_open-1)));
    	
    	adlib=lyric_line;
    	
  		do i=1 to countw(adlib,' ');
     		lyrics=scan(adlib,i, ' ');
     		output;
  		end;
	
	keep lyric_line lyrics;

	run;
	
	proc sql;
		create table adlib&year._final as
			select lyrics, compress(lyrics,,'p') as without_punct length = 32
		from adlib&year;
	quit;
	
	%let i=%eval(&i+1);
    %end;
	
%mend strip_parantheses;

%strip_parantheses;


%macro freq;
	
	%let i=1;
    
    %do %until (%scan(&yearlist,&i)= );
        %let year=%scan(&yearlist,&i);
	
	proc freq data=adlib&year._final noprint;
	tables without_punct / nocum nopercent
						out=adlibsforyear&year;
	run;
	
	%let i=%eval(&i+1);
    %end;
        
    quit;
	
%mend freq;

%freq;

%macro select(year=);
	%let i=1;
    
    %do %until (%scan(&yearlist,&i)= );
        %let year=%scan(&yearlist,&i);
	title "&year";
	
	proc sql;
		create table merge_sets&year as
		select without_punct, count, &year as year_created from adlibsforyear&year
		where count>2;
	quit;
	
		%let i=%eval(&i+1);
    %end;
        
    quit;
%mend select;

%select; 

%macro graph(year=);
	%let i=1;
    %do %until (%scan(&yearlist,&i)= );
        %let year=%scan(&yearlist,&i);
	TITLE 'Common Adlibs Used by Artists (freq>2) in &year';
	PROC SGPLOT DATA = merge_sets&year;
		VBAR without_punct / RESPONSE = count;
		label without_punct="Adlib Used by Artist";
	RUN; 
	TITLE;
			%let i=%eval(&i+1);
    %end;
        
    quit;
%mend graph;

%graph;

data all_adlibs;
	set merge_sets1979 merge_sets1983 merge_sets1987
    	merge_sets1991 merge_sets1995 merge_sets1999
    	merge_sets2003 merge_sets2011 merge_sets2015
    	merge_sets2019; 
    label without_punct='Adlib Used by Artist'
    	  count='Frequency';
run;

proc sgplot data=all_adlibs;
	vbar without_punct / response=count group=year_created;
	xaxis display=(nolabel);
	yaxis grid  label='Sales';
run;

