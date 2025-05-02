const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#222436", /* black   */
  [1] = "#ff5370", /* red     */
  [2] = "#c3e88d", /* green   */
  [3] = "#ff995e", /* yellow  */
  [4] = "#86e1fc", /* blue    */
  [5] = "#baacff", /* magenta */
  [6] = "#ff98a4", /* cyan    */
  [7] = "#e0def4", /* white   */

  /* 8 bright colors */
  [8]  = "#2f334d",  /* black   */
  [9]  = "#ff757f",  /* red     */
  [10] = "#77e0c6", /* green   */
  [11] = "#ff995e", /* yellow  */
  [12] = "#b4f9f8", /* blue    */
  [13] = "#c099ff", /* magenta */
  [14] = "#ff98a4", /* cyan    */
  [15] = "#e0def4", /* white   */

  /* special colors */
  [256] = "#212337", /* background */
  [257] = "#c8d3f5", /* foreground */
  [258] = "#e0def4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
