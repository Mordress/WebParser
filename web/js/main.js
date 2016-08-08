var links = document.querySelectorAll('a'); // получить все элементы <a>
for (var i=0;i<=links.length;i++) {
    var link = links[i];
    link.addEventListener('click',substitute_href.bind(link)); // назначить каждому <a> обработчик клика
};
function substitute_href(e) {
    e.preventDefault(); // не обрабатывать клик дальше
    document.getElementById('paste').value = this.getAttribute('href'); //подставить в #paste значение href
}