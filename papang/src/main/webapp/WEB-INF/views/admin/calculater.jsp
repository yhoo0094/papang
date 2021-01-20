<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Calculator</title>
<style>
#body * {
	box-sizing: border-box;
	font-family: 'Rubik', sans-serif;
}

#bo {
	background-color: #E6E8E6;
}

#bo h1 {
	color: #fff;
	text-align: center;
	margin-top: 50px;
}

#bo .calculator {
	background-color: #b7cae8;
	border-radius: 20px;
	width: 300px;
	padding: 20px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 5px 5px 10px #8e96a2;
}

#bo .display {
	background-color: #F5F1E3;
	border: none;
	width: 100%;
	height: 50px;
	border-radius: 16px;
	margin: 10px 0;
	text-align: right;
	font-size: 20px;
	padding: 0 20px;
}

#bo .display:focus {
	outline: none;
}

#bo input[type=number]::-webkit-inner-spin-button, #bo input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}

#bo button {
	border: none;
	background-color:#172e57;
	border-radius: 5px;
	color: #fff;
	font-size: 24px;
	width: 60px;
	height: 40px;
	cursor: pointer;
}

#bo button:focus {
	outline: none;
}
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap"
	rel="stylesheet">

<script>
  let currentOp = '',
  currentVal = 0;


function digitBtnHandler() {
const digits = document.querySelectorAll('.digit');
digits.forEach(digit => {
  digit.addEventListener('click', (evt) => {
    const display = document.querySelector('.display');
    let targetDigit = evt.target.innerText;
    display.value += targetDigit;
    // displayFormat(targetDigit);
  })
})
}

//function displayFormat(num) {
// const display = document.querySelector('.display');
// let n = parseInt(display.value.replace(/\D/g, ''), 10); 
// display.value = n.toLocaleString('en');
//}

function calculate(operator, val1, val2) {
if (operator === '+') {
  return val1 + val2;
} else if (operator === '-') {
  return val1 - val2;
} else if (operator === '*') {
  return val1 * val2;
} else if (operator === '/') {
  return val1 / val2;
}
}

function operatorBtnHandler() {
const operatorBtns = document.querySelectorAll('.operator');
operatorBtns.forEach(operatorBtn => {
  operatorBtn.addEventListener('click', (evt) => {
    const display = document.querySelector('.display');
    let displayVal = Number(display.value);
    if (evt.target.innerText === '=') {
      display.value = calculate(currentOp, currentVal, displayVal);
      // let disVal = display.value;
      // displayFormat(disVal);
      currentOp = '';
      return;
    }
    if (currentOp === '') {
      currentVal = Number(display.value);
    } else {
      currentVal = calculate(currentOp, currentVal, displayVal);
    }
    display.value = '';
    currentOp = evt.target.innerText;
  })
})
}

function clearBtnHandler() {
const clearBtn = document.querySelector('.clear');
clearBtn.addEventListener('click', () => {
  const display = document.querySelector('.display');
  currentOp = '';
  currentVal = 0;
  display.value = '';
})
}

function decimalBtnHandler() {
const decimalBtn = document.querySelector('.decimal');
decimalBtn.addEventListener('click', () => {
  const display = document.querySelector('.display');
  let displayVal = display.value;
  if (!displayVal.includes('.')) {
    let addDecimal = display.value + '.';
    display.value = addDecimal;
  }
})
}



function init() {
digitBtnHandler();
operatorBtnHandler();
clearBtnHandler();
decimalBtnHandler();
}

init();
  </script>

<div id='bo'>
	<div class="calculator">
		<input type="text" class="display" />
		<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<button type="button" class="operator">+</button>
					</td>
					<td>
						<button type="button" class="operator">-</button>
					</td>
					<td>
						<button type="button" class="operator">*</button>
					</td>
					<td>
						<button type="button" class="operator">/</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="digit">7</button>
					</td>
					<td>
						<button type="button" class="digit">8</button>
					</td>
					<td>
						<button type="button" class="digit">9</button>
					</td>
					<td>
						<button type="button" class="clear">C</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="digit">4</button>
					</td>
					<td>
						<button type="button" class="digit">5</button>
					</td>
					<td>
						<button type="button" class="digit">6</button>
					</td>
					<td rowspan="3">
						<button type="button" class="operator" style="height: 124px;">=</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="digit">1</button>
					</td>
					<td>
						<button type="button" class="digit">2</button>
					</td>
					<td>
						<button type="button" class="digit">3</button>
					</td>
					<!-- <td>
            <button type="button"></button>
          </td> -->
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="digit" style="width: 100%;">0</button>
					</td>
					<td>
						<button type="button" class="decimal">.</button>
					</td>
					<!-- <td></td>
          <td></td> -->
				</tr>
			</tbody>
		</table>
	</div>
</div>
