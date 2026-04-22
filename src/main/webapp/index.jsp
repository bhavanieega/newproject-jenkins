<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NexusShop — Modern E-Commerce</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
--bg:#f4f7fb;
--primary:#0f172a;
--accent:#6366f1;
--accent2:#22c55e;
--muted:#6b7280;
--card:#fff;
--gradient:linear-gradient(135deg,#6366f1,#22c55e);
}

*{box-sizing:border-box;transition:.2s}
body{margin:0;font-family:Inter;background:var(--bg);color:var(--primary)}

/* HEADER */
header{
position:sticky;top:0;z-index:10;
display:flex;justify-content:space-between;align-items:center;
padding:14px 24px;
background:rgba(255,255,255,.7);
backdrop-filter:blur(10px);
}

.brand{font-family:Poppins;font-size:22px;font-weight:700}
.brand span{color:var(--accent)}

.search{
display:flex;align-items:center;
background:white;padding:8px 14px;
border-radius:999px;
box-shadow:0 5px 20px rgba(0,0,0,.08);
}
.search input{border:none;outline:none}

/* HERO */
.hero{
height:420px;
display:flex;justify-content:center;align-items:center;
text-align:center;color:white;
background:linear-gradient(rgba(0,0,0,.6),rgba(0,0,0,.6)),
url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
}
.hero h1{font-size:48px;margin:0}

/* BUTTON */
.btn{
padding:10px 18px;border:none;border-radius:999px;
cursor:pointer;font-weight:600
}
.btn-primary{
background:var(--gradient);
color:white;
box-shadow:0 10px 25px rgba(99,102,241,.3)
}
.btn-primary:hover{transform:translateY(-3px)}

/* GRID */
.grid{display:grid;gap:20px;padding:40px}

/* CATEGORIES */
.categories{grid-template-columns:repeat(auto-fit,minmax(150px,1fr))}
.cat-card{
background:white;padding:20px;border-radius:16px;text-align:center
}
.cat-card:hover{
transform:translateY(-8px);
box-shadow:0 20px 40px rgba(0,0,0,.08)
}

/* PRODUCTS */
.products{grid-template-columns:repeat(auto-fit,minmax(250px,1fr))}
.product{
background:white;border-radius:16px;overflow:hidden
}
.product img{
width:100%;height:200px;object-fit:cover
}
.product:hover{
transform:translateY(-10px);
box-shadow:0 25px 50px rgba(0,0,0,.1)
}
.product:hover img{transform:scale(1.08)}
.product-body{padding:15px}
.price{font-weight:700}
.cart-count{
background:var(--accent);
color:white;border-radius:50%;
padding:4px 8px;font-size:12px;margin-left:6px
}

/* DEAL */
.deal{
margin:40px;display:flex;
background:white;border-radius:20px;overflow:hidden
}
.deal img{width:50%;object-fit:cover}
.deal-content{padding:20px}

/* FOOTER */
footer{text-align:center;padding:30px;color:var(--muted)}
</style>
</head>

<body>

<header>
<div class="brand">Nexus<span>Shop</span></div>

<div class="search">
<input type="text" id="searchInput" placeholder="Search products">
<i class="fas fa-search"></i>
</div>

<div>
<i class="fas fa-shopping-cart"></i>
<span class="cart-count" id="cartCount">0</span>
</div>
</header>

<section class="hero">
<div>
<h1>Premium Collection</h1>
<p>Best products at best prices</p>
<button class="btn btn-primary">Shop Now</button>
</div>
</section>

<!-- Categories -->
<div class="grid categories" id="categories"></div>

<!-- Products -->
<div class="grid products" id="products"></div>

<!-- Deal -->
<div class="deal">
<img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8">
<div class="deal-content">
<h2>MacBook Air M2</h2>
<p>Special limited offer</p>
<button class="btn btn-primary">Buy Now</button>
</div>
</div>

<footer>© 2026 NexusShop</footer>

<script>
const categories=[
"Smartphones","Laptops","Clothing","Gadgets"
];

const products=[
{id:1,name:"iPhone 14",price:999,cat:"Smartphones",img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"},
{id:2,name:"MacBook Pro",price:1999,cat:"Laptops",img:"https://images.unsplash.com/photo-1593642632823"},
{id:3,name:"Headphones",price:199,cat:"Gadgets",img:"https://images.unsplash.com/photo-1518441902112"},
{id:4,name:"T-Shirt",price:29,cat:"Clothing",img:"https://images.unsplash.com/photo-1521337581100"}
];

let cart=0;

function renderCategories(){
const el=document.getElementById("categories");
categories.forEach(c=>{
el.innerHTML+=`<div class="cat-card">${c}</div>`;
});
}

function renderProducts(list){
const el=document.getElementById("products");
el.innerHTML="";
list.forEach(p=>{
el.innerHTML+=`
<div class="product">
<img src="${p.img}">
<div class="product-body">
<h4>${p.name}</h4>
<p>${p.cat}</p>
<div class="price">$${p.price}</div>
<button class="btn btn-primary" onclick="addToCart()">Add</button>
</div>
</div>`;
});
}

function addToCart(){
cart++;
document.getElementById("cartCount").innerText=cart;
}

document.getElementById("searchInput").addEventListener("input",(e)=>{
const q=e.target.value.toLowerCase();
const filtered=products.filter(p=>p.name.toLowerCase().includes(q)||p.cat.toLowerCase().includes(q));
renderProducts(filtered);
});

renderCategories();
renderProducts(products);
</script>

</body>
</html>
