export const getTimeIntervalList = () => {
  // 15分間隔の時間のリストを返す
  const hours = [...Array(24)].map((_, i) => ("0" + i).slice(-2));
  const minutes = ["00", "15", "30", "45"];
  const timeList = hours
    .map((hour) => minutes.map((minute) => hour + ":" + minute))
    .flat();
  return timeList;
};
