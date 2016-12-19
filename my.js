var timespan = countdown(new Date(),function(ts){$('#big_time').html(ts.toHTML());},countdown.HOURS|countdown.MINUTES|countdown.SECONDS|countdown.MILLISECONDS,2,1);
