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
  grid-template-red: repeat(11, 1fr);
  width: 770px;
  height: 770px;
  position: fixed;
  left: 2%;
  top: 5%;
}

</style>
