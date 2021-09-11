(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test1_1 = is_older ((1,2,3),(2,3,4)) = true
val test1_2 = is_older ((1,2,3),(1,2,3)) = false
val test1_3 = is_older ((1,1,1),(1,1,1)) = false
val test1_4 = is_older ((2,3,4),(1,2,3)) = false

val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month ([(2012,2,28),(2013,12,1)],5) = 0
val test2_3 = number_in_month ([(2012,2,28),(2013,12,1),(2013,12,1),(2013,12,1)],12) = 3
val test2_4 = number_in_month ([],12) = 0

val test3_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4]) = 1
val test3_3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[11,10,9]) = 0
val test3_4 = number_in_months ([(2011,4,28)],[4]) = 1
val test3_5 = number_in_months ([],[2,3,4]) = 0
val test3_6 = number_in_months ([],[]) = 0
val test3_7 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0

val test4_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_2 = dates_in_month ([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]
val test4_3 = dates_in_month ([(2012,2,28),(2015,2,11),(2013,12,1),(2011,2,1)],2) = [(2012,2,28),(2015,2,11),(2011,2,1)]
val test4_4 = dates_in_month ([(2012,2,28),(2013,12,1)],3) = []
val test4_5 = dates_in_month ([],2) = []

val test5_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12]) = [(2013,12,1)]
val test5_3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5_4 = dates_in_months ([],[12]) = []
val test5_5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5]) = []
val test5_6 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,7]) = []

val test6_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6_2 = get_nth (["hi", "there", "how", "are", "you"], 4) = "are"
val test6_3 = get_nth (["hi"], 1) = "hi"

val test7_1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test7_2 = date_to_string (1999, 1, 22) = "January 22, 1999"
val test7_3 = date_to_string (2019, 12, 30) = "December 30, 2019"

val test8_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_3 = number_before_reaching_sum (11, [1,2,3,4,5]) = 4
val test8_4 = number_before_reaching_sum (16, [1,2,3,4,5,6]) = 5

val test9_1 = what_month 70 = 3
val test9_2 = what_month 1 = 1
val test9_3 = what_month 32 = 2
val test9_4 = what_month 365 = 12
val test9_5 = what_month 334 = 11

val test10_1 = month_range (31, 34) = [1,2,2,2]
val test10_2 = month_range (30, 31) = [1,1]
val test10_3 = month_range (1, 2) = [1, 1]
val test10_4 = month_range (364, 365) = [12, 12]
val test10_5 = month_range (10, 8) = []

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)