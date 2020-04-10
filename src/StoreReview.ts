/**
 * 跳转到市场进行评分
 * Created at 2020-04-10 09:23
 *
 * @author Wheeler https://github.com/WheelerLee
 * @copyright 2020 Activatortube, INC.
 *
 */
import { Platform, NativeModules } from 'react-native';

const NativeStoreReview = NativeModules['StoreReview'];

export default class StoreReview {

  /**
   * Open App Store or google play to review
   * @param appleId Apple ID, Assigned by appstoreconnect
   * @param packageName Android package
   */
  static show(appleId: string, packageName: string) {
    if (Platform.OS === 'ios') {
      const version = Platform.Version as string;
      let versions = version.split('.');
      //iOS10.3以上(含)，可以直接在APP中弹出来评分窗口
      if (parseInt(versions[0]) > 10 || (parseInt(versions[0]) === 10 && parseInt(versions[1]) >= 3)) { 
        NativeStoreReview.show();
      } else {
        NativeStoreReview.showOldWay(appleId);
      }
    } else {
      NativeStoreReview.show(packageName);
    }
  }

}