import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/networking/api_result.dart';
import 'package:users_list/features/home/data/models/users_response_model.dart';
import 'package:users_list/features/home/data/repos/users_repo.dart';
import 'package:users_list/features/home/logic/cubit/users_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  late final PagingController<int, UserRecord> _pagingController =
      PagingController(
        getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
        fetchPage: (pageKey) => emitFetchUsersStates(pageKey),
      );
  UsersCubit(this.usersRepo) : super(UsersState.initial());
  PagingController<int, UserRecord> get pagingController => _pagingController;

  Future<List<UserRecord>> emitFetchUsersStates(int page) async {
    final response = await usersRepo.fetchUsers(page, 10);
    return response.when(
      success: (data) {
        emit(UsersState.success(data));
        return data.data ?? [];
      },
      failure: (error) {
        emit(UsersState.error(error: error.apiErrorModel.message));
        throw Exception(error.apiErrorModel.message);
      },
    );
  }

  @override
  Future<void> close() {
    _pagingController.dispose();
    return super.close();
  }
}
