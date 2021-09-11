  fun is_older(date1: int*int*int, date2: int*int*int) =
  if (#1 date1) = (#1 date2) andalso (#2 date1) = (#2 date2)
  then (#3 date1) < (#3 date2)
  else if (#1 date1) = (#1 date2) andalso (#3 date1) = (#3 date2)
  then (#2 date1) < (#2 date2)
  else (#1 date1) < (#1 date2)

fun number_in_month (dates: (int*int*int) list, month: int) =
  if null dates
  then 0
  else
    let fun count_months (current_dates: (int*int*int) list, count: int) =
      if null current_dates
      then count
      else if (#2 (hd current_dates)) = month
      then count_months(tl current_dates, count + 1)
      else count_months(tl current_dates, count)
    in
      count_months(dates, 0)
    end

fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))

fun dates_in_month (dates: (int*int*int) list, month: int) =
  if null dates
  then []
  else if #2 (hd dates) = month
  then hd dates :: dates_in_month(tl dates, month)
  else dates_in_month(tl dates, month)

fun dates_in_months (dates: (int*int*int) list, months: int list) =
  if null dates orelse null months
  then []
  else
    let fun filter_dates (remaining_months: int list, filtered_dates: (int*int*int) list) =
      if null remaining_months
      then filtered_dates
      else filter_dates(tl remaining_months, filtered_dates @ dates_in_month(dates, hd remaining_months))
    in
      filter_dates(months, [])
    end

fun get_nth (string_list: string list, nth: int) =
  if nth = 1
  then hd string_list
  else get_nth(tl string_list, nth - 1)

fun date_to_string (date: (int*int*int)) =
  let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  in
    get_nth(months, (#2 date)) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end

fun number_before_reaching_sum (sum: int, int_list: int list) =
  let fun number_before_reaching_sum (int_list: int list, acc: int, n: int) =
    if acc >= sum
    then n - 1 
    else number_before_reaching_sum(tl int_list, acc + hd int_list, n + 1)
  in
    number_before_reaching_sum(int_list, 0, 0)
  end

fun what_month (day: int) =
  let val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in number_before_reaching_sum(day, days) + 1
  end

fun month_range (day1: int, day2: int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest (dates: (int*int*int) list) =
  if null dates
  then NONE
  else
    let val tl_ans = oldest(tl dates)
    in if isSome(tl_ans) andalso is_older(valOf(tl_ans), hd dates)
      then tl_ans
      else SOME(hd dates)
    end