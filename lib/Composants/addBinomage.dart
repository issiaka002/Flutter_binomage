import 'package:flutter/material.dart';
import 'dart:async';

import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';


class AddBinomage extends StatefulWidget {
  const AddBinomage({super.key});

  @override
  State<AddBinomage> createState() => _AddBinomageState();
}

// class _UploadImageState extends State<UploadImage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class _AddBinomageState extends State<AddBinomage> {
  List<Asset> images = <Asset>[];
  List<Asset> image_filleul = <Asset>[];


  @override
  void initState() {
    super.initState();
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }


  Widget _buildGridViewFilleul() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(image_filleul.length, (index) {
        Asset asset = image_filleul[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  // ... Parrain
  Future<void> _loadAssets() async {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    List<Asset> resultList = <Asset>[];

    const AlbumSetting albumSetting = AlbumSetting(
      fetchResults: {
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumFavorites,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.album,
          subtype: PHAssetCollectionSubtype.albumRegular,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumSelfPortraits,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumPanoramas,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumVideos,
        ),
      },
    );
    const SelectionSetting selectionSetting = SelectionSetting(
      min: 0,
      max: 3,
      unselectOnReachingMax: true,
    );
    const DismissSetting dismissSetting = DismissSetting(
      enabled: true,
      allowSwipe: true,
    );
    final ThemeSetting themeSetting = ThemeSetting(
      backgroundColor: colorScheme.background,
      selectionFillColor: colorScheme.primary,
      selectionStrokeColor: colorScheme.onPrimary,
      previewSubtitleAttributes: const TitleAttribute(fontSize: 12.0),
      previewTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
      albumTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
    );
    const ListSetting listSetting = ListSetting(
      spacing: 5.0,
      cellsPerRow: 4,
    );
    final CupertinoSettings iosSettings = CupertinoSettings(
      fetch: const FetchSetting(album: albumSetting),
      theme: themeSetting,
      selection: selectionSetting,
      dismiss: dismissSetting,
      list: listSetting,
    );

    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          doneButton:
          UIBarButtonItem(title: 'Confirmer', tintColor: colorScheme.primary),
          cancelButton:
          UIBarButtonItem(title: 'Supprimer', tintColor: colorScheme.primary),
          albumButtonColor: colorScheme.primary,
          settings: iosSettings,
        ),
        materialOptions: MaterialOptions(
          actionBarColor: colorScheme.surface,
          actionBarTitleColor: colorScheme.onSurface,
          statusBarColor: colorScheme.surface,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: colorScheme.primary,
        ),
      );
    } on Exception {
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  // .... Filleul
  Future<void> _loadAssets_filleul() async {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    List<Asset> resultList_filleul = <Asset>[];

    const AlbumSetting albumSetting = AlbumSetting(
      fetchResults: {
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumFavorites,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.album,
          subtype: PHAssetCollectionSubtype.albumRegular,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumSelfPortraits,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumPanoramas,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumVideos,
        ),
      },
    );
    const SelectionSetting selectionSetting = SelectionSetting(
      min: 0,
      max: 3,
      unselectOnReachingMax: true,
    );
    const DismissSetting dismissSetting = DismissSetting(
      enabled: true,
      allowSwipe: true,
    );
    final ThemeSetting themeSetting = ThemeSetting(
      backgroundColor: colorScheme.background,
      selectionFillColor: colorScheme.primary,
      selectionStrokeColor: colorScheme.onPrimary,
      previewSubtitleAttributes: const TitleAttribute(fontSize: 12.0),
      previewTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
      albumTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
    );
    const ListSetting listSetting = ListSetting(
      spacing: 5.0,
      cellsPerRow: 4,
    );
    final CupertinoSettings iosSettings = CupertinoSettings(
      fetch: const FetchSetting(album: albumSetting),
      theme: themeSetting,
      selection: selectionSetting,
      dismiss: dismissSetting,
      list: listSetting,
    );

    try {
      resultList_filleul = await MultiImagePicker.pickImages(
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          doneButton:
          UIBarButtonItem(title: 'Confirmer', tintColor: colorScheme.primary),
          cancelButton:
          UIBarButtonItem(title: 'Supprimer', tintColor: colorScheme.primary),
          albumButtonColor: colorScheme.primary,
          settings: iosSettings,
        ),
        materialOptions: MaterialOptions(
          actionBarColor: colorScheme.surface,
          actionBarTitleColor: colorScheme.onSurface,
          statusBarColor: colorScheme.surface,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: colorScheme.primary,
        ),
      );
    } on Exception {
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      image_filleul = resultList_filleul;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Importation photos'),
      ),
      body: Column(
        children: <Widget>[
          //Center(child: Text('Error: $_error')),
          ElevatedButton(
            onPressed: _loadAssets,
            child: const Row(
              children: [
                Text("Importer image parrain"),
                Icon(Icons.add_a_photo)
              ],
            ),
          ),
          Expanded(
            child: _buildGridView(),
          ),
          ElevatedButton(
            onPressed: _loadAssets_filleul,
            child: const Row(
              children: [
                Text("Importer image filleul"),
                Icon(Icons.add_a_photo)
              ],
            ),
            
          ),
          Expanded(
            child: _buildGridViewFilleul(),
          )
        ],
      ),
    );
  }
}
