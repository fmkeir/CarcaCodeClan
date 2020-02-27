<template lang="html">
  <div class="board-container">
    <div v-for="(square, index) in boardState">
      <img :src="boardState[index]" alt="Board" v-if="square">
    </div>
  </div>

</template>

<script>
export default {
  name: 'board',
  props: ["boardState"]
}
</script>

<style lang="css" scoped>
.board-container {
  display: grid;
  grid-template-columns: repeat(11, 1fr);
  grid-template-red: repeat(11, 1fr);
  width: 770px;
  height: 770px;
}

.board-container div {
  border: 1px solid black;
  transition: transform .2s;
  background-color: #826848;
  /* background-image: linear-gradient(
  rgba(0, 0, 10, 0.4),
  rgba(0, 0, 10, 0.4)
), url('../../public/images/wood_back.jpeg'); */
}

.board-container div:hover {
  transform: scale(1.5);
  z-index: 1;
}

</style>
