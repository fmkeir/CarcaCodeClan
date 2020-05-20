<template lang="html">
  <div class="board-container">
    <square v-for="(square, index) in boardState" :index="index" :boardState="boardState" :boardIsEmpty="boardIsEmpty">
    </square>
  </div>

</template>

<script>
import Square from './Square.vue'
import {eventBus} from '@/main.js'

export default {
  name: 'board',
  props: ["boardState"],
  components: {
    'square': Square
  },
  data() {
    return {
      boardIsEmpty: true
    }
  },
  mounted() {
    eventBus.$on('tile-reset', payload => {this.boardIsEmpty = false})
  }
}
</script>

<style lang="css" scoped>
.board-container {
  display: grid;
  grid-template-columns: repeat(11, 1fr);
  grid-template-rows: repeat(11, 1fr);
  width: 99vh;
  height: 99vh;
  margin-top: 0.5vh;
  margin-left: 0.5vh;
}

</style>
