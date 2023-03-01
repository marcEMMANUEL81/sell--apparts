<template>
    <section class="gallery reveal-2">
        <div class="gallery js-flickity" ref="flickity" data-flickity='{ "autoPlay": true, "wrapAround": 2000}'>
            <div class="gallery-cell">
                <img class="gallerie__img" src="../assets/a1.jpg" alt="">
            </div>
            <div class="gallery-cell">
                <img class="gallerie__img" src="../assets/a2.jpg" alt="">
            </div>
            <div class="gallery-cell">
                <img class="gallerie__img" src="../assets/a3.jpg" alt="">
            </div>
            <div class="gallery-cell">
                <img class="gallerie__img" src="../assets/a4.jpg" alt="">
            </div>
            <div class="gallery-cell">
                <img class="gallerie__img" src="../assets/a5.jpg" alt="">
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'ImageSlider',
};
</script>