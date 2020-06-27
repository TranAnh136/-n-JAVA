let labels4 =['Khai vị','Món chính','Tráng miệng','Đồ uống'];
let data4 = [6,6,6,7];
let color4 = ['#49A9EA','#36CAAB','green','#B370CF'];

let myChart4 = document.getElementById("myChart").getContext('2d');
let chart4 = new Chart(myChart4,{
	type:'pie',
	data: {
		labels: labels4,
		datasets:[{
			data: data4,
			backgroundColor: color4
		}]
	},
	options:{
		title: {
			text: "Thông số các loại món ăn được giới thiệu ",
			display: true
		}
	}
});