function setRatingListeners() {
    const stars = document.querySelector(".ratings").children;
    const ratingValue = document.getElementById("rating-value");
    const ratingValueDisplay = document.getElementById("rating-value-display");
    let index;

    for(let i=0; i<stars.length; i++){
        stars[i].addEventListener("mouseover", function() {
            for(let j=0; j<stars.length; j++){
                stars[j].classList.remove("fa-star");
                stars[j].classList.add("fa-star-o");
            }
            for(let j=0; j<=i; j++){
                stars[j].classList.remove("fa-star-o");
                stars[j].classList.add("fa-star");
            }
        });

        stars[i].addEventListener("click", function() {
            ratingValue.value = i+1;
            ratingValueDisplay.textContent = ratingValue.value;
            index = i;
        });

        stars[i].addEventListener("mouseout", function() {
            for(let j=0; j<stars.length; j++){
                stars[j].classList.remove("fa-star");
                stars[j].classList.add("fa-star-o");
            }
            for(let j=0; j<=index; j++){
                stars[j].classList.remove("fa-star-o");
                stars[j].classList.add("fa-star");
            }
        });
    }
}

// ページ遷移後に再度リスナーを設定
document.addEventListener("turbo:load", setRatingListeners);

// 初回ロード時にリスナーを設定
window.addEventListener("load", setRatingListeners);

document.addEventListener('DOMContentLoaded', function() {
    // star.jsの初期化コード
  });
  
