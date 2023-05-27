<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Filter Product</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
		integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		:root {
			--gra: linear-gradient(45deg, cyan, royalblue);
		}

		* {
			padding: 0;
			margin: 0;
			box-sizing: border-box;
		}

		main {
			width: 98%;
			background: white;
			margin: 60px auto;
			font-family: sans-serif;
		}

		header {
			width: 100%;
			height: 100px;
			border-bottom: 2px solid #e5e5e5;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		header ul li {
			list-style: none;
			padding: 20px;
			margin: 10px;
			float: left;
			font-size: 20px;
			border-radius: 35px;
			/*background: red;*/

		}

		header ul li a {
			color: inherit;
			text-decoration: none;
		}

		header ul li.active {
			background: var(--gra);
		}

		header ul li.active a {
			color: white;
			font-weight: bold;
		}

		.filter-condition {
			padding: 20px;
			height: 100px;
			font-size: 20px;
			font-weight: bold;
			display: flex;
			justify-content: space-between;
		}

		.filter-condition select {
			width: 120px;
			padding: 0 0 0 10px;
			margin-right: 10px;
			border: none;
			outline: none;
			font-weight: bold;
			color: purple;
			background: transparent;
			cursor: pointer;
		}

		.product-field {
			padding: 20px;
		}

		.product-field ul {
			width: 100%;
			display: flex;
			flex-wrap: wrap;
		}

		.product-field ul li {
			list-style: none;
			width: 23%;
			height: 400px;
			transition: 0.5s all;
			background: whitesmoke;
			/*overflow: hidden;*/
			border-radius: 20px;
			padding: 20px;
			margin: 200px 10px 0 10px;
			position: relative;
		}

		picture {
			background: #eee;
			padding: 5px;
			position: absolute;
			right: 0;
			bottom: 41%;
			width: 75%;
			height: 85%;
			border-radius: 50px 20px 0 20px;
			transform: skewY(40deg);
			overflow: hidden;
			box-shadow: 0px 1px 0px #00000020, -1px 0px 0px #ccc;
		}

		picture img {
			width: 95%;
			z-index: 1;
			transform: skewY(-40deg);
			padding: 25px 0 0 0;
		}

		.detail {
			width: 100%;
			height: 100%;
		}

		.detail .icon {
			width: 30%;
			height: 55%;
			padding: 20px 5px;
		}

		.icon span {
			background: #00000030;
			display: inline-block;
			width: 50px;
			height: 50px;
			line-height: 50px;
			text-align: center;
			padding: 0;
			border-radius: 50%;
			margin: 0 0 20px 5px;
			font-size: 20px;
			color: white;
		}

		.icon span:hover {
			background: var(--gra);
			cursor: pointer;
		}

		.detail>strong {
			display: inherit;
			margin: 20px;
			font-size: 30px;
			letter-spacing: 2px;
			color: #555;
		}

		.detail>span {
			display: inherit;
			padding: 0 20px;
			width: 80%;
		}

		.detail small {
			display: inline-block;
			padding: 8px 20px;
			margin: 15px;
			font-weight: bold;
			border-radius: 6px;
			border: 1px solid #999;
			cursor: pointer;
		}

		.detail small:hover {
			background: var(--gra);
			color: white;
			border-color: cyan;
		}

		li h4 {
			position: absolute;
			right: 10px;
			top: 50%;
			font-size: 30px;
			color: #555;
			text-shadow: 1px 1px 2px black;
		}
	</style>
</head>

<body>

	<main>
		<header>
			<ul class="indicator">
				<li data-filter="all" class="active"><a href="#">All</a></li>
				<li data-filter="t-shirt"><a href="#">T-Shirt</a></li>
				<li data-filter="jeans"><a href="#">Jeans</a></li>
				<li data-filter="pant"><a href="#">Pant</a></li>
				<li data-filter="kurti"><a href="#">Kurti</a></li>
				<li data-filter="tops"><a href="#">Tops</a></li>
				<li data-filter="leggings"><a href="#">Legging</a></li>
				<li data-filter="jackets"><a href="#">Jacket</a></li>
				<li data-filter="hoodies"><a href="#">Hoodie</a></li>
			</ul>

			<div class="filter-condition">
				<label for="select"><span>Sort Price</span></label>
				<select name="select" id="select">
					<option value="Default">Default</option>
					<option value="LowToHigh">Low to high</option>
					<option value="HighToLow">High to low</option>
				</select>
				
			</div>
		</header>
		
		<div class="product-field">
			<ul class="items">
			
			<c:forEach var="pro" items="${productList}">
			
				<li data-category="" data-price="">
					<picture>
						<img src="images/${pro.getPhoto()}" alt="">
					</picture>
					<div class="detail">
						<p class="icon">
							<span><i class="far fa-heart"></i></span>
							<span><i class="far fa-share-square"></i></span>
							<span><i class="fas fa-shopping-basket"></i></span>
						</p>
						<strong>${pro.name}</strong>
						<span class="gender">${pro.brand}</span>
						<small>Buy now</small>
					</div>
					<h4>$${pro.price}</h4>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</main>
	<script>
	(function () {

		let field = document.querySelector('.items');
		let li = Array.from(field.children);

		class FilterProduct {
			constructor() {
				for (let i of li) {
					const name = i.querySelector('strong');
					const x = name.textContent.toLowerCase();
					i.setAttribute("data-category", x);
				}

				let indicator = document.querySelector('.indicator').children;
				let list = [];
				this.run = function () {
					for (let i = 0; i < indicator.length; i++) {
						indicator[i].onclick = function () {
							for (let x = 0; x < indicator.length; x++) {
								indicator[x].classList.remove('active');
							}
							this.classList.add('active');
							const displayItems = this.getAttribute('data-filter').toLowerCase();
console.log(displayItems);
							for (let z = 0; z < li.length; z++) {
								li[z].style.transform = "scale(0)";
								setTimeout(() => {
									li[z].style.display = "none";
								}, 500);

								if ((li[z].getAttribute('data-category') == displayItems) || displayItems == "all") {

									li[z].style.transform = "scale(1)";
									console.log(displayItems+"ook");

									setTimeout(() => {
										li[z].style.display = "block";
									}, 500);

								} else {
									console.log(displayItems+"hello");
								}
							}
						};
					}
				};
			}
		}




		class SortProduct {
			constructor() {
				let select = document.getElementById('select');
				let ar = [];
				for (let i of li) {
					const last = i.lastElementChild;
					const x = last.textContent.trim();
					const y = Number(x.substring(1));
					i.setAttribute("data-price", y);
					ar.push(i);
				}
				this.run = () => {
					addevent();
				};
				function addevent() {
					select.onchange = sortingValue;
				}
				function sortingValue() {

					if (this.value === 'Default') {
						while (field.firstChild) { field.removeChild(field.firstChild); }
						field.append(...ar);
					}
					if (this.value === 'LowToHigh') {
						SortElem(field, li, true);
					}
					if (this.value === 'HighToLow') {
						SortElem(field, li, false);
					}
				}
				function SortElem(field, li, asc) {
					let dm, sortli;
					dm = asc ? 1 : -1;
					sortli = li.sort((a, b) => {
						const ax = a.getAttribute('data-price');
						const bx = b.getAttribute('data-price');
						return ax > bx ? (1 * dm) : (-1 * dm);
					});
					while (field.firstChild) {
						field.removeChild(field.firstChild);
					}
					field.append(...sortli);
				}
			}
		}

		new FilterProduct().run();
		new SortProduct().run();

	})();
	</script>

</body>

</html>
