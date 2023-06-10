--film tablosunda film uzunluğu length sütununda gösterilmektedir. 
--Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
select count(*)ortalamadan_fazla_filmler from film 
where length > (
				select avg(length) 
				from film);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
select count(*)
from film
where rental_rate = (
					 select max(rental_rate)
					 from film);
	

--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
select title
from film
where rental_rate = (select min(rental_rate) from film) and replacement_cost = (select min(replacement_cost) from film);



--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

select payment.customer_id , count(customer.first_name)kac_kere
from payment
join staff on payment.staff_id = staff.store_id 
join customer on customer.customer_id = staff.staff_id
group by payment.customer_id 
order by kac_kere desc
;

 