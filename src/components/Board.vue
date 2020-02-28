<template lang="html">
  <div class="board-container">
    <square v-for="(square, index) in boardState">
      <img :src="boardState[index]" alt="Board" v-if="square">
    </square>
  </div>

</template>

<script>
import Square from './Square.vue'

export default {
  name: 'board',
  props: ["boardState"],
  components: {
    'square': Square
  }
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

</style>
